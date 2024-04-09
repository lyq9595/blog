import axios from 'axios'
import { Message } from 'element-ui'
const service = axios.create({
  //    设置基础地址
// 环境变量 npm run dev  /api   /生产环境 npm run build  /prod-api
  baseURL: process.env.VUE_APP_BASE_API,
  timeout: 10000 // 认为只要超过5秒钟不响应 就超时
})
service.interceptors.request.use()
service.interceptors.response.use(response => {
  // axios默认加一层data
  const { success, message, data } = response.data
  if (success) {
    return data
  } else {
    // 业务出错了
    Message.error(message)
    return Promise.reject(new Error(message))
  }
}, error => {
  Message.error(error.message)// 提示错误消息
  return Promise.reject(error)// 返回执行错误 让当前的执行链跳出成功 直接进入 catch
})

export default service
