const { environment } = require('@rails/webpacker')
const vue =  require('./loaders/vue')
const post =  require('./loaders/post')

environment.loaders.append('vue', vue)
environment.loaders.append('post', post)
const config = environment.toWebpackConfig()

config.resolve.alias = {

  vue: "vue/dist/vue.esm.js",

}
module.exports = environment
