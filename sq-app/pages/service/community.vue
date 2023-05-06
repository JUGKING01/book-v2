<template>
	<view>
		<view class="cu-card dynamic" v-for="(item, index) in stacklist" :key="index">
			<view class="cu-item shadow">
				<view class="cu-list menu-avatar">
					<view class="cu-item">
						<view class="cu-avatar round lg"
							style="background-image:url(https://img0.baidu.com/it/u=1715665884,3273559605&fm=253&fmt=auto&app=138&f=JPEG?w=489&h=500);">
						</view>
						<view class="content flex-sub">
							<view>LIEFox</view>
							<view class="text-gray text-sm flex justify-between">
								2019年3月22日
							</view>
						</view>
					</view>
				</view>
				<view class="text-content">
					不要活在我的阴影下，你可以自己走向光明
				</view>
				<view class="grid flex-sub padding-lr col-1">
					<view class="bg-img only-img"
						style="background-image:url(https://cxq21.gitee.io/images/cover7.jpg);">
					</view>
				</view>
				<view class="grid flex-sub padding col-3 grid-square">
					<view class="bg-img"
						style="background-image:url(https://cxq21.gitee.io/images/cover7.jpg);">
					</view>
					<view class="bg-img"
						style="background-image:url(https://cxq21.gitee.io/images/cover7.jpg);">
					</view>
					<view class="bg-img"
						style="background-image:url(https://cxq21.gitee.io/images/cover7.jpg);">
					</view>
				</view>
				<view class="text-gray text-sub  padding flex justify-end">
					<u-icon name="eye"></u-icon> 10
					<u-icon name="heart"></u-icon> 20
					<u-icon name="chat"></u-icon> 30
				</view>

				<view class="cu-list menu-avatar comment solids-top">
					<view class="cu-item">
						<view class="cu-avatar round"
							style="background-image:url(https://cxq21.gitee.io/images/LIEFox.png);">
						</view>
						<view class="content">
							<view class="text-grey">莫甘娜</view>
							<view class="text-gray text-content text-df">
								钱流向了不缺钱的人
							</view>
							<view class="bg-grey padding-sm radius margin-top-sm  text-sm">
								<view class="flex">
									<view>LIEFox：</view>
									<view class="flex-sub">爱给了不缺爱的人</view>
								</view>
							</view>
							<view class="margin-top-sm flex justify-between">
								<view class="text-gray text-df">2018年12月4日</view>
								<view>
									<text class="cuIcon-appreciatefill text-red"></text>
									<text class="cuIcon-messagefill text-gray margin-left-sm"></text>
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
</template>

<script>
	export default {
		data() {
			return {
				scrollTop: 0,
				status: 'loadmore',
				stacklist: 6,
				page: 0,
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
		methods: {

		}
	}
</script>

<style>

</style>
