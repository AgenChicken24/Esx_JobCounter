-- compatibility wrapper
fx_version 'bodacious'
game 'gta5'


client_script "client.lua"

ui_page "html/index.html"
files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
    'html/reset.css'
}

server_scripts {
    'server.lua'
}