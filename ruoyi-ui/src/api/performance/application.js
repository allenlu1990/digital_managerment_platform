import request from '@/utils/request'

// 查询公告列表
export function listApplication(query) {
  return request({
    url: '/performance/application/list',
    method: 'get',
    params: query
  })
}

// 查询公告详细
export function getApplication(applicationId) {
  return request({
    url: '/performance/application/' + applicationId,
    method: 'get'
  })
}

// 新增公告
export function addApplication(data) {
  return request({
    url: '/performance/application',
    method: 'post',
    data: data
  })
}

// 修改公告
export function updateApplication(data) {
  return request({
    url: '/performance/application',
    method: 'put',
    data: data
  })
}

// 删除公告
export function delApplication(applicationId) {
  return request({
    url: '/performance/application/' + applicationId,
    method: 'delete'
  })
}