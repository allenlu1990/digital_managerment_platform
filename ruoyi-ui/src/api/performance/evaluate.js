import request from '@/utils/request'

// 查询评分列表
export function listEvaluate(query) {
  return request({
    url: '/performance/evaluate/list',
    method: 'get',
    params: query
  })
}

// 查询评分详细
export function getEvaluate(evaluateId) {
  return request({
    url: '/performance/evaluate/' + evaluateId,
    method: 'get'
  })
}

// 修改评分
export function updateEvaluate(data) {
  return request({
    url: '/performance/evaluate',
    method: 'put',
    data: data
  })
}

// 获取被评人员
export function listTaskOwners(query) {
  return request({
    url: '/performance/evaluate/task/owners',
    method: 'get',
    params: query
  })
}

