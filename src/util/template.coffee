hogan = require 'hogan.js'
path = require 'path'
fs = require 'fs'

class TemplateHelper
    @render: (template, context) ->
        readTemplateFile(template, (file) ->
            console.log(compileHoganTemplate(file, context))
        )

    @createFileFromTemplate: (template, outputFile, context) ->
        readTemplateFile(template, (file) ->
            fs.writeFile outputFile, compileHoganTemplate(file, context), (err) ->
                throw err if err
        )

    readTemplateFile = (template, callback) ->
        templatePath = generateTemplatePath(template)

        fs.readFile templatePath, "utf-8", (err, file) ->
            throw err if err
            callback(file)

    generateTemplatePath = (template) ->
        path.join(__dirname, '../../templates/', "#{template}.mustache")

    compileHoganTemplate = (file, context) ->
        hogan.compile(file).render(context)

module.exports = TemplateHelper