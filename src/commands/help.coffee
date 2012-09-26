
template = require "../util/template"

class HelpCommand
  @execute: (options) ->
    commands = require "../commands"
    template.render "help", commands: Object.keys(commands).join(", ")

module.exports = HelpCommand