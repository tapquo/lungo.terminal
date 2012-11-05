bower = require 'bower'

class InstallCommand
  @execute: (options) ->
    packageName = options.params[0]

    bower.commands['install']([packageName]).on("data", (data) ->
      data and console.log "lungo" + data.substring(5)
    ).on("end", (data) ->
      data and console.log "lungo" + data.substring(5)
    ).on "error", (err) -> throw err if err

module.exports = InstallCommand
