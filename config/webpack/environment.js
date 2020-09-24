const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const scss = require('./loaders/scss')

 //после активации вьютифай лоадер плагина отключается variables.scss файл :(
const VuetifyLoaderPlugin = require('vuetify-loader/lib/plugin')
environment.plugins.prepend('VuetifyLoaderPlugin', new VuetifyLoaderPlugin())

// environment.loaders.prepend('scss', scss)
// Get the actual sass-loader config
const sassLoader = environment.loaders.get('sass')
const sassLoaderConfig = sassLoader.use.find(function(element) {
  return element.loader == 'sass-loader'
})

// Use Dart-implementation of Sass (default is node-sass)
const options = sassLoaderConfig.options
options.implementation = require('sass')
options.additionalData = `@import "app/scss/variables.scss"`

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())

environment.loaders.prepend('vue', vue)

module.exports = environment
 
 