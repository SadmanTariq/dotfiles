#!/usr/bin/python3
import tekore as tk
from time import sleep

CFG_PATH = '/home/sadmantariq/.config/tekore.cfg'
OUTPUT = "/home/sadmantariq/Scripts/spotify-current-song/output"
MAX_STRING_LENGTH = 60
REFRESH_INTERVAL = 2

# output_file = None


def _ms_to_formatted(time_in_ms):
    mins = int(time_in_ms / 60000)
    secs = int((time_in_ms % 60000) / 1000)
    return str(mins) + ':' + str(secs).zfill(2)


def _clear_file(file_path):
    with open(file_path, 'w') as f:
        f.write(" ")


def main():
    conf = tk.config_from_file(CFG_PATH, return_refresh=True)
    token = tk.refresh_user_token(*conf[:2], conf[3])

    spotify = tk.Spotify(token)

    while True:
        sleep(REFRESH_INTERVAL)

        cp = None

        try:
            cp = spotify.playback_currently_playing()
        except Exception:
            pass

        if cp is None:
            _clear_file(OUTPUT)
            continue

        play_indicator = '' if cp.is_playing else '  '
        timestamp = (_ms_to_formatted(cp.progress_ms) + '/' +
                     _ms_to_formatted(cp.item.duration_ms))
        artists = ", ".join([a.name for a in cp.item.artists])
        song_name = cp.item.name

        formatted = f"  [{play_indicator}{timestamp}] {artists} - {song_name}"

        if len(formatted) > MAX_STRING_LENGTH:
            formatted = formatted[:MAX_STRING_LENGTH - 3] + "..."

        with open(OUTPUT, 'w') as f:
            f.write(formatted)

        print(formatted)


if __name__ == "__main__":
    while True:
        try:
            main()
        except BaseException as e:
            _clear_file(OUTPUT)
            if e is KeyboardInterrupt:
                raise e
