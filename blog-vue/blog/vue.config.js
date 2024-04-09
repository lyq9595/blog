module.exports = {
  transpileDependencies: ["vuetify"],
  devServer: {
    proxy: {
      "/api": {
        target: "http://localhost:8080",
        changeOrigin: true,
        pathRewrite: {
          "^/api": ""
        }
      },

    },
    disableHostCheck: true
  },
  productionSourceMap: false,
  css: {
    extract: true,
    sourceMap: false
  },
  //优化打包配合cdn
  chainWebpack: config => {
    // 发布模式
    config.when(process.env.NODE_ENV === 'production', config => {
      config
          .entry('app')
          .clear()
          .add('./src/main-prod.js')

      config.set('externals', {
        vue: 'Vue',
        'vue-router': 'VueRouter',
        axios: 'axios',
        'vuex': 'Vuex',
        nprogress: 'NProgress',


        // 'highlight.js':'highlight'
        // 'vuetify': 'Vuetify'
        // 'animate':'animated',
      })

      config.plugin('html').tap(args => {
        args[0].isProd = true
        return args
      })
    })

    // 开发模式
    config.when(process.env.NODE_ENV === 'development', config => {
      config
          .entry('app')
          .clear()
          .add('./src/main.js')

      config.plugin('html').tap(args => {
        args[0].isProd = false
        return args
      })
    })
  },
};
