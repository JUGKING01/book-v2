import request from '@/utils/request'

// 查询详情内容
export function getDetail(id) {
    return request({
        url: `/public/bookM/books/`+id,
        method: 'get'
    })
}
// 查询作者详情
export function getWriterInfo(query) {
    return request({
        url: `/public/writer/writer/list`,
        method: 'get',
        params: query
    })
}
// 查询期刊列表
export function ListBook(query) {
    return request({
        url: `/public/bookM/books/list`,
        method: 'get',
        params: query
    })
}


// 新增排行参数
export function addRankParm(data) {
    return request({
        url: '/public/rankParm/rankParm',
        method: 'post',
        data: data
    })
}
