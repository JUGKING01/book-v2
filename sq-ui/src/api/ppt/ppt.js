import request from '@/utils/request'

// 查询前台首页幻灯片列表
export function listPpt(query) {
  return request({
    url: '/ppt/ppt/list',
    method: 'get',
    params: query
  })
}

// 查询前台首页幻灯片详细
export function getPpt(pptId) {
  return request({
    url: '/ppt/ppt/' + pptId,
    method: 'get'
  })
}

// 新增前台首页幻灯片
export function addPpt(data) {
  return request({
    url: '/ppt/ppt',
    method: 'post',
    data: data
  })
}

// 修改前台首页幻灯片
export function updatePpt(data) {
  return request({
    url: '/ppt/ppt',
    method: 'put',
    data: data
  })
}

// 删除前台首页幻灯片
export function delPpt(pptId) {
  return request({
    url: '/ppt/ppt/' + pptId,
    method: 'delete'
  })
}

// 导出前台首页幻灯片
export function exportPpt(query) {
  return request({
    url: '/ppt/ppt/export',
    method: 'get',
    params: query
  })
}