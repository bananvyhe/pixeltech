const { dev_server: devServer } = require('@rails/webpacker').config

const isProduction = process.env.NODE_ENV === 'production'
const inDevServer = process.argv.find(v => v.includes('webpack-dev-server'))
module.exports = {
   
     
      // SASS has different line endings than SCSS
      // and cannot use semicolons in the markup
      
 
      // SCSS has different line endings than SASS
      // and needs a semicolon after the import.
       
        test: /\.scss$/,
        use: [
          'vue-style-loader',
          'css-loader',
          {
            loader: 'sass-loader',
     
            // Requires sass-loader@^8.0.0
            options: {
              // This is the path to your variables
              prependData: "@import '@/javascript/stylesheet/scss/variables.scss';"
            },
       
          },
        ],
       
     
   
}