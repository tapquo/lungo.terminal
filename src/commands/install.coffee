bower = require 'bower'

class InstallCommand
  @execute: (options) ->
    packageName = options.params[0]

    bower.commands['install']([packageName]).on("data", (data) ->
      data and console.log data
    ).on("end", (data) ->
      data and console.log data
    ).on "error", (err) -> throw err if err

module.exports = InstallCommand
