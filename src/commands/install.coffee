nopt = require 'nopt'
{exec} = require 'child_process'

class InstallCommand

  @execute: (options) ->
    packageName = options.params[0]

    exec "bower install #{packageName}", (error, stdout) ->
      throw error if error
      console.log(stdout)

module.exports = InstallCommand
