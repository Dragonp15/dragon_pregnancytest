fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Dragon'
description 'Teste de Gravidez Simples'
version '1.0.0'

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/testegravida.png',
    'html/testegravidapositivo.png',
    'html/testegravidanegativo.png'
}

dependencies {
    'ox_inventory'
}