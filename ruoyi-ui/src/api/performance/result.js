import request from '@/utils/request'

// 查询绩效结果列表
export function listResult(query) {
  return request({
    url: '/performance/result/list',
    method: 'get',
    params: query
  })
}

// 根据申请ID查询评判详细
export function getResultEvaluations(applicationId) {
  return request({
    url: '/performance/result/evaluations/' + applicationId,
    method: 'get'
  })
}
