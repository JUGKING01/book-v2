<template>

	<el-container>
		<cmsNavBar></cmsNavBar>
		<keep-alive>
			<cmsMain></cmsMain>
		</keep-alive>
		<el-footer height="40px">
			<cmsFooter></cmsFooter>
		</el-footer>
	</el-container>
</template>

<script>
	import cmsMain from './main.vue'
	import cmsNavBar from './NavBar.vue'
	import cmsFooter from './Footer.vue'

	export default {
		data() {
			return {};
		},
		methods: {
			handleSelect(key, keyPath) {
				console.log(key, keyPath);
			}
		},
		components: {
			cmsMain,
			cmsNavBar,
			cmsFooter
		},

	}
</script>

<style scoped>
	.el-footer {
		background-color: rgba(48, 176, 143, 1.0);
	}


	@media screen and (max-width: 768px) {
		.title {
			width: 100%;
			background-position-x: center;
			background-position-y: 0;
		}
	}
</style>
