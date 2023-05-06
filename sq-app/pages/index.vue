<template>
	<!-- #ifndef APP-NVUE || MP-TOUTIAO -->
	<view class="u-demo-block">
		<u-swiper :list="PPTList" keyName="pptPic" previousMargin="30" nextMargin="30" circular :autoplay="true"
			radius="5" bgColor="#ffffff" @click="toDetail" showTitle></u-swiper>
		<view style="margin: 20rpx;" class="bg-white margin-top-xs ">
			<view class="cu-bar bg-white margin-top-xs ">
				<view class="action sub-title u-skeleton-rect">
					<text class="text-xl text-bold text-red text-shadow cuIcon-titles">推荐</text>
					<text class="text-ABC text-red">Shiqirecommend</text>
				</view>
				<view class="action" @click="recommendMore">
					<text class="cuIcon-right text-shadow text-black">更多</text>
				</view>
			</view>
			<u-scroll-list>
				<view class="scroll-list" style="flex-direction: row;">
					<view class="scroll-list__goods-item" v-for="(item, index) in list" :key="index"
						:class="[(index === 9) && 'scroll-list__goods-item--no-margin-right']">
						<image class="scroll-list__goods-item__image" :src="item.thumb"></image>
						<text class="scroll-list__goods-item__text">《生吞之胆小鬼》</text>
					</view>
					<view class="scroll-list__show-more" @click="recommendMore">
						<text class="scroll-list__show-more__text">查看更多</text>
						<u-icon name="arrow-leftward" color="#f56c6c" size="12"></u-icon>
					</view>
				</view>
			</u-scroll-list>

			<view class="cu-bar bg-white margin-top-xs ">
				<view class="action sub-title u-skeleton-rect">
					<text class="text-xl text-bold text-red text-shadow cuIcon-titles">书库</text>
					<text class="text-ABC text-red">Shiqistack</text>
				</view>
			</view>

			<view class="cu-card case" v-for="(item, index) in stacklist" :key="index">
				<view class="cu-item shadow">
					<view class="image">
						<image
							src="https://bkimg.cdn.bcebos.com/pic/faf2b2119313b07ec067285203d7912396dd8c95?x-bce-process=image/resize,m_lfit,w_536,limit_1/format,f_jpg"
							mode="widthFix">
						</image>
						<view class="cu-tag bg-red">热</view>
						<view class="cu-bar bg-shadeBottom">
							<text
								class="text-cut">2003年冬，十七岁少女黄姝惨遭奸杀，全身赤裸被弃尸于一幢烂尾楼——“鬼楼”前的雪坑。“鬼楼”案震惊全市，而重要嫌疑人在追捕中意外受重创成为植物人。大雪覆盖了胴体也掩盖了重要线索，作案手法和动机成迷。十年后，又一具少女尸体被剥光衣服丢进雪坑，作案手段完全复刻，可昔日重大嫌疑人却早已去世，追查此案的老刑警冯国金再次坠入迷雾。随着尘封旧案重见天日，一段深埋在五个少男少女间的残酷青春往事浮出水面，冯国金的女儿亦被牵扯其中。真凶近在咫尺，但真相远比案件更残酷。</text>
						</view>
					</view>
					<view class="cu-list menu-avatar">
						<view class="cu-item">
							<view class="cu-avatar round lg"
								style="background-image:url(https://bkimg.cdn.bcebos.com/pic/32fa828ba61ea8d3fd1f79cef640274e251f94caf2ed?x-bce-process=image/resize,m_lfit,w_536,limit_1/format,f_jpg);">
							</view>
							<view class="content flex-sub">
								<view class="text-grey">《生吞》</view>
								<view class="text-gray text-sm flex justify-between">
									<text class="text-black">作者:郑执</text>
									<view class="text-gray text-sm flex justify-between">
										<u-icon name="eye"></u-icon> 10
										<u-icon name="heart"></u-icon> 20
										<u-icon name="chat"></u-icon> 30
									</view>
								</view>
							</view>
						</view>
					</view>
				</view>
			</view>
			<u-loadmore :status="status" />
			<u-back-top :scroll-top="scrollTop" top="300"></u-back-top>
		</view>

	</view>
	<!-- #endif -->
</template>

<script>
	import {
		getPpt
	} from '@/api/service/public'
	import config from '@/config'
	export default {
		data() {
			return {
				scrollTop: 0,
				status: 'loadmore',
				stacklist: 6,
				page: 0,
				PPTList: [],
				baseUrl: config.baseUrl,
				list: [{
					price: '230.5',
					thumb: 'https://bkimg.cdn.bcebos.com/pic/faf2b2119313b07ec067285203d7912396dd8c95?x-bce-process=image/resize,m_lfit,w_536,limit_1/format,f_jpg'
				}, {
					price: '230.5',
					thumb: 'https://bkimg.cdn.bcebos.com/pic/faf2b2119313b07ec067285203d7912396dd8c95?x-bce-process=image/resize,m_lfit,w_536,limit_1/format,f_jpg'
				}, {
					price: '230.5',
					thumb: 'https://bkimg.cdn.bcebos.com/pic/faf2b2119313b07ec067285203d7912396dd8c95?x-bce-process=image/resize,m_lfit,w_536,limit_1/format,f_jpg'
				}, {
					price: '230.5',
					thumb: 'https://bkimg.cdn.bcebos.com/pic/faf2b2119313b07ec067285203d7912396dd8c95?x-bce-process=image/resize,m_lfit,w_536,limit_1/format,f_jpg'
				}, {
					price: '230.5',
					thumb: 'https://bkimg.cdn.bcebos.com/pic/faf2b2119313b07ec067285203d7912396dd8c95?x-bce-process=image/resize,m_lfit,w_536,limit_1/format,f_jpg'
				}, {
					price: '230.5',
					thumb: 'https://bkimg.cdn.bcebos.com/pic/faf2b2119313b07ec067285203d7912396dd8c95?x-bce-process=image/resize,m_lfit,w_536,limit_1/format,f_jpg'
				}, {
					price: '230.5',
					thumb: 'https://bkimg.cdn.bcebos.com/pic/faf2b2119313b07ec067285203d7912396dd8c95?x-bce-process=image/resize,m_lfit,w_536,limit_1/format,f_jpg'
				}, {
					price: '230.5',
					thumb: 'https://bkimg.cdn.bcebos.com/pic/faf2b2119313b07ec067285203d7912396dd8c95?x-bce-process=image/resize,m_lfit,w_536,limit_1/format,f_jpg'
				}, ]
			}
		},
		onPageScroll(e) {
			this.scrollTop = e.scrollTop;
		},
		onReachBottom() {
			if (this.page >= 3) return;
			this.status = 'loading';
			this.page = ++this.page;
			setTimeout(() => {
				this.stacklist += 6;
				if (this.page >= 3) this.status = 'nomore';
				else this.status = 'loading';
			}, 2000)
		},
		onLoad() {
			this.getPPT()
		},
		methods: {
			getPPT() {
				let obj = {};
				obj.pptDesc = 1
				getPpt(obj).then(res => {
					this.PPTList = JSON.parse(JSON.stringify(res.rows).replace(/pptName/g, "title"))
					this.PPTList.map(item => {
						return item.pptPic = this.baseUrl + item.pptPic
					})
				})
			},
			recommendMore() {
				this.$modal.showToast('模块建设中~')
			},
			toDetail(e) {
				if (this.PPTList[e].pptType === 1) {
					this.$modal.showToast('模块建设中~')
				}
				if (this.PPTList[e].pptType === 2 || this.PPTList[e].pptType === 3) {
					this.$tab.navigateTo(
						`/pages/common/webview/index?title=${this.PPTList[e].title}&url=${this.PPTList[e].pptUrl}`)
				}

			}
		}
	}
</script>

<style lang="scss">
	.u-page__text-item {
		margin-right: 10px;
		flex: 1;
	}

	.u-demo-block__content {
		@include flex;
		flex-direction: row;
		flex-wrap: wrap;
		align-items: center;
	}

	.scroll-list {
		@include flex(column);

		&__goods-item {
			margin-right: 20px;

			&__image {
				width: 120px;
				height: 140px;
				border-radius: 10px;
			}

			&__text {
				color: #000000;
				text-align: center;
				font-size: small;
				margin-top: 5px;
			}
		}

		&__show-more {
			background-color: #fff0f0;
			border-radius: 3px;
			padding: 3px 6px;
			@include flex(column);
			align-items: center;

			&__text {
				font-size: 16px;
				width: 12px;
				color: #f56c6c;
				line-height: 34px;
			}
		}
	}
</style>
