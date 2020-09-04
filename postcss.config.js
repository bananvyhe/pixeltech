module.exports = {
  plugins: [
    require('postcss-import'),
        require('postcss-simple-vars'),
    require('postcss-color-function'),
    require('postcss-extend'),
    require('postcss-flexbugs-fixes'),
    require('postcss-nested'),
    require('postcss-custom-media'),
    require('lost'),
    require('postcss-assets')({
      loadPaths: ['images/'],
      basePath: 'public',
      cachebuster: true,
    }),
    
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    }),
    require('postcss-typography')({
 
    baseFontSize: "14px",
    baseLineHeight: 1.35,  
    scaleRatio: 2,
    blockMarginBottom: 0.8,
    includeNormalize: true,
 
      overrideThemeStyles: ({ rhythm }, options, styles) => ({
        
           
       
        'p': {

          marginBottom: rhythm(0.2),
          marginTop: rhythm(0.0),
        },
        'h5': {
          LineHeight: 1,  
          marginBottom: rhythm(0.2),
          marginTop: rhythm(0.5),
          // color: "hsla(0,0%,0%,0.7)",
        },
        'h1,h2,h3,h4': {
          LineHeight: 1.2,  
          marginBottom: rhythm(0.4),
          marginTop: rhythm(0.4),
          
        }
      })
    }),

   require('postcss-font-magician')({
    custom: {
      'elemend': {
        variants: {
          normal: {
            400: {
              url: {
                woff2: '../fonts/elemental_end_italic-webfont.woff2'
              }
            } 
          }
        }
      },      
      'aprior': {
        variants: {
          normal: {
            400: {
              url: {
                woff2: '../fonts/aprior_normal-webfont.woff2'
              }
            } 
          }
        }
      },
      'bulgFant': {
        variants: {
          normal: {
            400: {
              url: {
                woff2: '../fonts/bulgaria_fantastica_cyr-webfont.woff2'
              }
            } 
          }
        }
      },
      'Telidon': {
        variants: {
          normal: {
            400: {
              url: {
                woff2: '../fonts/telidon_con_it.woff2'
              }
            } 
          }
        }
      },
       'TelidonReg': {
        variants: {
          normal: {
            400: {
              url: {
                woff2: '../fonts/telidon_reg.woff2'
              }
            } 
          }
        }
      },

      'RobotoReg': {
        variants: {
          normal: {
            400: {
              url: {
                woff2: '../fonts/roboto-regular-webfont.woff2'
              }
            } 
          },
          light: {
            300: {
              url: {
                woff2: '../fonts/roboto-light-webfont.woff2'
              }
            } 
          }          
        }
      },

      'OpenSans': {
        variants: {
          light: {
            300: {
              url: {
                woff2: '/fonts/opensans-light-webfont.woff2'
              }
            }             
          }
        }
      }
    }})    
  ]
}
