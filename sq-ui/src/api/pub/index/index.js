import request from '@/utils/request'

// 查询前台首页幻灯片
export function indexPpt(query) {
    return request({
        url: '/public/ppt/ppt/list',
        method: 'get',
        params: query
    })
}
// 查询前台首页书库
export function indexBooks(query) {
    return request({
        url: '/public/bookM/books/list',
        method: 'get',
        params: query
    })
}
// 查询前台首页书库阅读总榜
export function readAllRank() {
    return request({
        url: '/public/rank/readAllRank',
        method: 'get'
    })
}
