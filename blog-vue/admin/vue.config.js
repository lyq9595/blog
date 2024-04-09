const defaultSettings = require('./src/settings.js')
const path = require("path");
function resolve(dir) {
  return path.join(__dirname, dir);
}
const name = defaultSettings.title || '博客后台管理系统'

module.exports = {

  configureWebpack: {
    name: name,
    resolve: {
      alias: {
        '@': resolve('./src')
      }
    }
  },
  //优化打包配合cdn
  chainWebpack: config => {
    config.resolve.alias.set("@", resolve("src"));



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
        'element-ui': 'ELEMENT',
        nprogress: 'NProgress',
        // 'mavon-editor': 'MavonEditor',
        'vue-echarts': 'VueECharts',
        'echarts': 'echarts'
        // lodash: '_',
        // 'vue-quill-editor': 'VueQuillEditor'
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
  productionSourceMap: false,
  devServer: {
    proxy: {
      "/api": {
        target: "http://localhost:8080",
        changeOrigin: true,
        pathRewrite: {
          "^/api": ""
        }
      }
    },
    disableHostCheck: true
  }
};


