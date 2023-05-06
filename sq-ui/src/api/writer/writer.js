import request from '@/utils/request'

// 查询作者管理列表
export function listWriter(query) {
  return request({
    url: '/writer/writer/list',
    method: 'get',
    params: query
  })
}

// 查询作者管理详细
export function getWriter(writerId) {
  return request({
    url: '/writer/writer/' + writerId,
    method: 'get'
  })
}

// 新增作者管理
export function addWriter(data) {
  return request({
    url: '/writer/writer',
    method: 'post',
    data: data
  })
}

// 修改作者管理
export function updateWriter(data) {
  return request({
    url: '/writer/writer',
    method: 'put',
    data: data
  })
}

// 删除作者管理
export function delWriter(writerId) {
  return request({
    url: '/writer/writer/' + writerId,
    method: 'delete'
  })
}

// 导出作者管理
export function exportWriter(query) {
  return request({
    url: '/writer/writer/export',
    method: 'get',
    params: query
  })
}