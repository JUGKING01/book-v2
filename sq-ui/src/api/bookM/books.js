import request from '@/utils/request'

// 查询期刊管理列表
export function listBooks(query) {
  return request({
    url: '/bookM/books/list',
    method: 'get',
    params: query
  })
}

// 查询期刊管理详细
export function getBooks(bookId) {
  return request({
    url: '/bookM/books/' + bookId,
    method: 'get'
  })
}

// 新增期刊管理
export function addBooks(data) {
  return request({
    url: '/bookM/books',
    method: 'post',
    data: data
  })
}

// 修改期刊管理
export function updateBooks(data) {
  return request({
    url: '/bookM/books',
    method: 'put',
    data: data
  })
}

// 删除期刊管理
export function delBooks(bookId) {
  return request({
    url: '/bookM/books/' + bookId,
    method: 'delete'
  })
}

// 导出期刊管理
export function exportBooks(query) {
  return request({
    url: '/bookM/books/export',
    method: 'get',
    params: query
  })
}
