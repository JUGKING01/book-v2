<template>
	<div class="app-container home">
		<el-row :gutter="20">
			<el-col :sm="24" :lg="12" style="padding-left: 20px">
				<h2>爱阅读 v2.0</h2>
				<h3>这是一个在线阅读的平台，分为三个阶段 </h3>

				<el-timeline>
					<el-timeline-item>
						后台管理平台 (期刊管理模块 + 读者管理模块 + 创作者管理模块 + 社区管理模块）
					</el-timeline-item>
					<el-timeline-item>
						前台阅读平台 (阅读模块 + 社区模块 + 创作者模块）
					</el-timeline-item>
					<el-timeline-item>
						小程序社区平台 (阅读模块 + 社区模块 + 创作者模块）
					</el-timeline-item>
				</el-timeline>

				<!-- <p>
					<el-button type="primary" size="mini" icon="el-icon-cloudy" plain
						@click="goTarget('https://gitee.com/cxq21/book')">访问仓库</el-button>
					<el-button size="mini" type="danger">免费开源
					</el-button>
				</p> -->

				<!-- <el-card>
					<div slot="header" class="clearfix">
						<span>联系信息</span>
					</div>
					<div class="body">
						<p>
							<i class="el-icon-s-promotion"></i> 官网：<el-link href="https://cxq21.gitee.io/"
								target="_blank">
								https://cxq21.gitee.io/</el-link>
						</p>
						<p>
							<i class="el-icon-user-solid"></i> QQ群：
							<a href="https://jq.qq.com/?_wv=1027&k=XKRmblB9" target="_blank">
								12345671</a>
						</p>
					</div>
				</el-card> -->
			</el-col>
			<!-- <el-col :sm="24" :lg="12">
				<el-card>
					<div slot="header" class="clearfix">
						<h1>捐赠支持</h1>
					</div>
					<img src="@/assets/images/wx.png" alt="donate" width="50%"/>
					<img src="@/assets/images/zfb.png" alt="donate" width="50%"/>
				</el-card>
			</el-col> -->



		</el-row>
		<el-divider />
		<!-- <el-row :gutter="20">
			<el-col :sm="24" :lg="12" style="padding-left: 50px">
				<div style="position: relative; width: 100%; height: 70%; padding-bottom: 75%;"><iframe
						src="//player.bilibili.com/player.html?aid=767479800&bvid=BV1Tr4y1q7Xx&cid=555423478&page=1"
						scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position: absolute; width: 100%;
				height: 100%; left: 0; top: 0;"> </iframe></div>
			</el-col>
			<el-col :sm="24" :lg="12">
				<img
					src="https://gitee.com/cxq21/book/widgets/widget_card.svg?colors=4183c4,ffffff,ffffff,e3e9ed,666666,9b9b9b" />
			</el-col>
		</el-row> -->
	</div>
</template>

<script>
	export default {
		name: "Index",
		data() {
			return {
				// 版本号
				version: "3.8.2",
			};
		},
		methods: {
			goTarget(href) {
				window.open(href, "_blank");
			},
		},
	};
</script>

<style scoped lang="scss">
	.home {
		blockquote {
			padding: 10px 20px;
			margin: 0 0 20px;
			font-size: 17.5px;
			border-left: 5px solid #eee;
		}

		hr {
			margin-top: 20px;
			margin-bottom: 20px;
			border: 0;
			border-top: 1px solid #eee;
		}

		.col-item {
			margin-bottom: 20px;
		}

		ul {
			padding: 0;
			margin: 0;
		}

		font-family: "open sans",
		"Helvetica Neue",
		Helvetica,
		Arial,
		sans-serif;
		font-size: 13px;
		color: #676a6c;
		overflow-x: hidden;

		ul {
			list-style-type: none;
		}

		h4 {
			margin-top: 0px;
		}

		h2 {
			margin-top: 10px;
			font-size: 26px;
			font-weight: 100;
		}

		p {
			margin-top: 10px;

			b {
				font-weight: 700;
			}
		}


	}
</style>
