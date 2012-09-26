statik = require 'node-static'

class ServerCommand
  SERVER_PORT = "8000"

  @execute: (options) ->
    createStaticFileServer(options)
    printStaticFileServerStatus()

  createStaticFileServer = (options) ->
    folderName = options?.params[0] ? '.'
    file = new (statik.Server)(folderName, cache: false)

    require("http").createServer((request, response) ->
      request.addListener "end", ->
        file.serve request, response
    ).listen SERVER_PORT

  printStaticFileServerStatus = ->
    console.log("Serving lungo project at http://127.0.0.1:#{SERVER_PORT}");

module.exports = ServerCommand