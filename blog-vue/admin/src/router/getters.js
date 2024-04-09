const getters = {
  sidebar: state => state.app.sidebar,
  device: state => state.app.device,
  token: state => state.user.token // 在根级的getters上 开发子模块的属性给别人看 给别人用
}
export default getters
