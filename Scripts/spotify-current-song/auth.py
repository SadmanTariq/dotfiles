#!/usr/bin/python3
import tekore as tk

client_id = '0cc77e3171754e04bf1db58de355b470'
client_secret = 'a7cbf1ba36c446ff8975eb665b283542'
redirect_uri = 'https://example.com/callback'   # Or your redirect uri
conf = (client_id, client_secret, redirect_uri)
file = '/home/sadmantariq/.config/tekore.cfg'

token = tk.prompt_for_user_token(*conf, scope=tk.scope.every)
tk.config_to_file(file, conf + (token.refresh_token,))
