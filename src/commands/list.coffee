bower = require 'bower'

class ListCommand
  @execute: (options) ->
    bower.commands['list']([]).on("data", (data) ->
      data and console.log data
    ).on("end", (data) ->
      data and console.log data
    ).on "error", (err) -> throw err if err

module.exports = ListCommand
