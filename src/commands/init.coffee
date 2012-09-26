shelljs = require "shelljs/global"
install = require "./install"
server = require "./server"
template = require "../util/template"

class InitCommand
  @execute: (options) ->
    projectName = options.params[0]

    return console.log 'Lungo error: You must specify the project name' unless projectName

    createProjectFolders(projectName)
    template.createFileFromTemplate("index", "index.html", name: projectName)
    install.execute(params: ["lungo"])
    server.execute() if options.flags.server

  createProjectFolders = (projectName) ->
    resourcesPath = "#{projectName}/app/resources"

    mkdir "-p", resourcesPath
    cd resourcesPath
    mkdir ["sections", "resources", "templates"]
    cd "../../"

module.exports = InitCommand