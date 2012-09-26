{exec} = require 'child_process'

class UpdateCommand
  @execute: (options) ->
    packageName = options.params[0]

    exec "bower update #{packageName}", (error, stdout) ->
      throw error if error
      console.log stdout

module.exports = UpdateCommand