import request from '@/utils/request'

// 查询评分列表
export function listEvaluations(type,date) {
  return request({
    url: '/performance/normal/'+type+'/'+date,
    method: 'get'
  })
}

// 新增公告
export function addEvaluations(data) {
    return request({
      url: '/performance/normal',
      method: 'post',
      data: data
    })
  }



