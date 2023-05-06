<template>
	<el-header :style="'margin-bottom:'+ headerBottom +'px'">
		<router-link to="/">
			<h1 class="logo" style="color: #30B08F;">爱阅读</h1>
		</router-link>
		<div class="bg-purple-light">
			<el-menu :default-active="activeIndex" router  mode="horizontal" style="border: none;"
				background-color="#545c64" text-color="#fff" active-text-color="#FD0000">
				<el-menu-item :index="item.path" v-for="item in menulist" :key="item.id" style="color: black;">
					<el-row>
						<el-col>
							<i :class="item.icon" style="color: black;"></i>
						</el-col>
						<el-col style="position: relative;top: -30px;">
							{{item.authName}}
						</el-col>
					</el-row>
				</el-menu-item>
			</el-menu>
		</div>
		<div v-if="islogin" class="bg-purple" style="position: relative;top: 10px">
			<el-dropdown class="avatar-container right-menu-item hover-effect" trigger="click">
				<div class="avatar-wrapper">
					<el-avatar class="user-avatar" :src="avatar" @error="errorHandler">
						<i class="el-icon-s-custom" />
					</el-avatar>
					<p class="avatar-Name">{{name}}</p>
				</div>
				<el-dropdown-menu slot="dropdown">
					<router-link target="_blank" to="/index">
						<el-dropdown-item>创作中心</el-dropdown-item>
					</router-link>
					<el-dropdown-item divided @click.native="logout">
						<span>退出登录</span>
					</el-dropdown-item>
				</el-dropdown-menu>
			</el-dropdown>
		</div>
		<div v-else class="bg-purple">
			<div class="avatar-wrapper">
				<el-row>
					<el-col style="position: relative;top: 20px">
						<i class="el-icon-user" />
					</el-col>
					<el-col style="position: relative; right: 46px;top: 10px">
						<p class="avatar-Name" @click="tologin">登录|注册</p>
					</el-col>
				</el-row>
			</div>
		</div>
	</el-header>
</template>

<script>
	import {
		mapGetters
	} from 'vuex'
	import {
		getToken
	} from '@/utils/auth'
	import 'element-ui/lib/theme-chalk/display.css'
	export default {
		name: 'cmsNavBar',
		data() {
			return {
				activeIndex: 'this.$router.path',
				islogin: false,
				menuHiddenVisiable: false,
				searchInput: true,
				headerBottom: 0,
				queryInfo: {
					query: '',
					timer: null
				},
				searchList: [],
				searching: false,
				menulist: [{
					id: 0,
					authName: '首页',
					path: '/cms/main/cmsIndex',
					icon: 'el-icon-monitor',
				}, ]
			};
		},
		computed: {
			...mapGetters([
				'avatar',
				'name'
			]),
		},
		created() {
			this.login();
			// this.ResponsiveLayout();
		},
		methods: {
			menulistAdd() {
				//push()方法一般是添加到数组的最后的位置；unshift()方法是往最前面的位置添加。
				// this.menulist.push({id:"",authName:""})
				this.menulist.unshift({
					id: "",
					authName: ""
				})
			},
			notSearching() {
				setTimeout(() => {
					this.searching = false
				}, 100)
			},
			checkInput() {
				this.searching = this.queryInfo.query !== '';
			},
			tologin() {
				this.$router.push({
					path: "/cmsLogin"
				});
			},
			login() {
				let token = getToken();
				if (token == null || token == '') {
					this.islogin = false;
				} else {
					this.islogin = true;
				}
			},
			errorHandler() {
				return true
			},
			
			async logout() {
				this.$confirm('确定注销并退出登录吗？', '提示', {
					confirmButtonText: '确定',
					cancelButtonText: '取消',
					type: 'warning'
				}).then(() => {
					this.$store.dispatch('LogOut').then(() => {
						location.href = '/cms/main/cmsIndex';
					})
				}).catch(() => {});
			}
		}
	}
</script>

<style scoped>
	.el-header {
		display: flex;
		justify-content: space-between;
		align-items: center;
		transition: .2s;
	}

	.el-header:hover {
		opacity: 1 !important;
	}

	.el-menu {
		flex-shrink: 0;
		background-color: rgba(0, 0, 0, 0) !important;
	}

	.el-menu /deep/ .el-menu-item {
		height: 70px;
		background-color: rgba(0, 0, 0, 0) !important;
	}


	.el-menu /deep/ .el-menu-item i {
		color: rgba(255, 255, 255);
	}

	.el-menu /deep/ .el-menu-item:hover i {
		color: white;
	}

	.el-menu /deep/ .el-menu-item:hover {
		background-color: rgba(48, 176, 143, 0.5) !important;
	}


	.bg-purple-light {
		float: right;
	}

	.bg-purple {
		float: right;
	}

	.user-avatar {
		float: left;
		cursor: pointer;
		border: dashed rgba($color: #ffff7f, $alpha: 0.5);
	}

	.avatar-container {
		margin-right: 30px;
	}

	.avatar-wrapper {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}

	.avatar-Name {
		margin-left: 10px;
		cursor: pointer;
		float: right;
		font-size: 16px;
		color: #000000;
	}

	.logo {
		float: left;
		margin-left: 50px;
		margin-top: 46px;
		color: #000000;
		font-size: 42px;
		font-weight: bold;
	}

	.logo:hover {
		cursor: pointer;
	}


	
</style>
