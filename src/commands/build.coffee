shelljs = require "shelljs/global"
compressor = require "node-minify"

class BuildCommand
  JS_EXTENSION = "js"
  CSS_EXTENSION = "css"
  BUILD_FOLDER_NAME = "build"

  @execute: (options) ->
    projectName = options.params[0]
    return console.log 'Lungo error: You must specify the project name' unless projectName

    appFolderName = options.params[1] ? 'app'

    jsFiles = findAllFilesByExtension(appFolderName, JS_EXTENSION)
    cssFiles = findAllFilesByExtension(appFolderName, CSS_EXTENSION)

    return console.log("Files to compile were not found.") unless jsFiles.length and cssFiles.length

    makeBuildFolder()
    minifyFiles(projectName, 'gcc', jsFiles, JS_EXTENSION)
    minifyFiles(projectName, 'yui-css', cssFiles, CSS_EXTENSION)

  findAllFilesByExtension = (appFolderName, extesion) ->
    find(appFolderName).filter((file) -> file.match new RegExp "\.(#{extesion})$")

  makeBuildFolder = ->
    rm "-rf", BUILD_FOLDER_NAME
    mkdir BUILD_FOLDER_NAME

  minifyFiles = (projectName, compressorType, files, fileOutExtension) ->
    new compressor.minify(
      type: compressorType
      fileIn: files
      fileOut: "#{BUILD_FOLDER_NAME}/#{projectName}.#{fileOutExtension}"
      callback: ->
        console.log "Compiling #{fileOutExtension}"
    )

module.exports = BuildCommand