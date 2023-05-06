import request from '@/utils/request'


// 获取首页轮播图
export function getPpt(query) {
	return request({
		'url': '/public/ppt/ppt/list',
		'method': 'get',
		params: query
	})
}

// 获取用户人数
export function getUserNum(query) {
	return request({
		'url': '/public/user/number',
		'method': 'get',
		params: query
	})
}
