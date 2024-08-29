fx_version "adamant"
game 'rdr3'
lua54 'yes'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'PersePixels'
description 'Proximity text chat'

client_scripts {'client.lua'}

server_scripts {'server.lua'}

files({
	"html/html.html",
	"html/style.css",
	"html/HapnaSlabSerif-Medium.ttf",
	"html/app.js"
})

ui_page "html/html.html"
