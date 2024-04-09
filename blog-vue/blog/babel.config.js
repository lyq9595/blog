const prodPlugins = [] //项目发布阶段需要的babel插件
if(process.env.NODE_ENV==='production'){
  prodPlugins.push('transform-remove-console')
}
module.exports = {
  presets: ["@vue/cli-plugin-babel/preset"],
  plugins: [
      //发布产品的插件数据
      ...prodPlugins
  ]
};
