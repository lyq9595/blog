// 这是项目发布阶段需要用到的 babel 插件
const prodPlugins = []
if (process.env.NODE_ENV === 'production') {
  prodPlugins.push('transform-remove-console')
}


module.exports = {
  presets: [
      "@vue/cli-plugin-babel/preset"
  ],
  plugins: [
      //发布产品插件数组 不用删除多余的console
      ...prodPlugins,
      //路由懒加载插件
      '@babel/plugin-syntax-dynamic-import'
  ]
};
