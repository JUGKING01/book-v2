<template>
	<div class="app-container">
		<el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="120px">
			<el-form-item label="期刊作者姓名" prop="bookWriterName">
				<!--        <el-input-->
				<!--            v-model="queryParams.bookWriterName"-->
				<!--            placeholder="请输入期刊作者姓名"-->
				<!--            clearable-->
				<!--            size="small"-->
				<!--            @keyup.enter.native="handleQuery"-->
				<!--        />-->
				<el-autocomplete class="inline-input" v-model="queryParams.bookWriterName"
					:fetch-suggestions="querySearch" placeholder="请输入期刊作者姓名" :trigger-on-focus="false"
					@select="handleQueryParams">
					<template slot-scope="{ item }">
						<el-row>
							<el-col :span="18">
								{{ item.writerName }}
							</el-col>
							<el-col :span="6">
								<el-avatar size="small" :src="baseUrl+item.writerPic" style="margin-top: 5px">
								</el-avatar>
							</el-col>
						</el-row>
					</template>
				</el-autocomplete>
			</el-form-item>
			<el-form-item label="期刊名" prop="bookName">
				<el-input v-model="queryParams.bookName" placeholder="请输入期刊名" clearable size="small"
					@keyup.enter.native="handleQuery" />
			</el-form-item>
			<el-form-item label="期刊类型" prop="bookType">
				<el-select v-model="queryParams.bookType" placeholder="请选择期刊类型" clearable size="small">
					<el-option v-for="dict in bookTypeOptions" :key="dict.dictValue" :label="dict.dictLabel"
						:value="dict.dictValue" />
				</el-select>
			</el-form-item>
			<el-form-item label="出版日期">
				<el-date-picker v-model="daterangeBookPubDate" size="small" style="width: 240px"
					value-format="yyyy-MM-dd" type="daterange" range-separator="-" start-placeholder="开始日期"
					end-placeholder="结束日期"></el-date-picker>
			</el-form-item>
			<el-form-item label="上传日期">
				<el-date-picker v-model="daterangeBookUpDate" size="small" style="width: 240px"
					value-format="yyyy-MM-dd" type="daterange" range-separator="-" start-placeholder="开始日期"
					end-placeholder="结束日期"></el-date-picker>
			</el-form-item>
			<el-form-item label="出版社" prop="bookPress">
				<el-input v-model="queryParams.bookPress" placeholder="请输入出版社" clearable size="small"
					@keyup.enter.native="handleQuery" />
			</el-form-item>

			<el-form-item label="审核状态" prop="bookAudit">
				<el-select v-model="queryParams.bookAudit" placeholder="请选择审核状态" clearable size="small">
					<el-option v-for="dict in bookAuditOptions" :key="dict.dictValue" :label="dict.dictLabel"
						:value="dict.dictValue" />
				</el-select>
			</el-form-item>

			<el-form-item>
				<el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
				<el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
			</el-form-item>
		</el-form>

		<el-row :gutter="10" class="mb8">
			<el-col :span="1.5">
				<el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
					v-hasPermi="['bookM:books:add']">新增
				</el-button>
			</el-col>
			<el-col :span="1.5">
				<el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate"
					v-hasPermi="['bookM:books:edit']">修改
				</el-button>
			</el-col>
			<el-col :span="1.5">
				<el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple"
					@click="handleDelete" v-hasPermi="['bookM:books:remove']">删除
				</el-button>
			</el-col>
			<el-col :span="1.5">
				<el-button type="warning" plain icon="el-icon-download" size="mini" :loading="exportLoading"
					@click="handleExport" v-hasPermi="['bookM:books:export']">导出
				</el-button>
			</el-col>
			<right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
		</el-row>

		<el-table v-loading="loading" :data="booksList" @selection-change="handleSelectionChange">
			<el-table-column type="selection" width="55" align="center" />
			<el-table-column label="期刊id" align="center" prop="bookId" />
			<el-table-column label="期刊作者姓名" align="center" prop="bookWriterName" />
			<el-table-column label="期刊名" align="center" prop="bookName" />
			<el-table-column label="期刊类型" align="center" prop="bookType">
				<template slot-scope="scope">
					<dict-tag :options="bookTypeOptions" :value="scope.row.bookType" />
				</template>
			</el-table-column>
			<el-table-column label="出版日期" align="center" prop="bookPubDate" width="180">
				<template slot-scope="scope">
					<span>{{ parseTime(scope.row.bookPubDate, '{y}-{m}-{d}') }}</span>
				</template>
			</el-table-column>
			<el-table-column label="上传日期" align="center" prop="bookUpDate" width="180">
				<template slot-scope="scope">
					<span>{{ parseTime(scope.row.bookUpDate, '{y}-{m}-{d}') }}</span>
				</template>
			</el-table-column>
			<el-table-column label="出版社" align="center" prop="bookPress" />
			<el-table-column label="期刊封面" align="center" prop="bookCover">
				<template slot-scope="scope">
					<el-tooltip class="item" effect="dark" placement="top">
						<el-image slot="content" :src="baseUrl+scope.row.bookCover" style="width: 200px;height: 200px">
						</el-image>
						<el-image :src="baseUrl+scope.row.bookCover"></el-image>
					</el-tooltip>
				</template>
			</el-table-column>
			<el-table-column label="审核状态" align="center" prop="bookAudit">
				<template slot-scope="scope">
					<dict-tag :options="bookAuditOptions" :value="scope.row.bookAudit" />
				</template>
			</el-table-column>
			<el-table-column label="操作" align="center" class-name="small-padding fixed-width">
				<template slot-scope="scope">
					<el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)"
						v-hasPermi="['bookM:books:edit']">修改
					</el-button>
					<el-button size="mini" type="text" >
						<el-link  type="primary" :href="`${baseUrl}${scope.row.bookPdfUrl}`" :underline="false" target="_blank">
						  <span class="el-icon-document"> 浏览 </span>
						</el-link>
					</el-button>

					<el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)"
						v-hasPermi="['bookM:books:remove']">删除
					</el-button>
				</template>
			</el-table-column>
		</el-table>

		<pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
			@pagination="getList" />

		<!-- 添加或修改期刊管理对话框 -->
		<el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
			<el-form ref="form" :model="form" :rules="rules" label-width="120px">
				<el-form-item label="期刊作者姓名" prop="bookWriterName">
					<!--          <el-input v-model="form.bookWriterName" placeholder="请输入期刊作者姓名" />-->
					<el-autocomplete class="inline-input" v-model="form.bookWriterName" :fetch-suggestions="querySearch"
						placeholder="请输入期刊作者姓名" :trigger-on-focus="false" @select="handleSelect">
						<template slot-scope="{ item }">
							<el-row>
								<el-col :span="18">
									{{ item.writerName }}
								</el-col>
								<el-col :span="6">
									<el-avatar size="small" :src="baseUrl+item.writerPic" style="margin-top: 5px">
									</el-avatar>
								</el-col>
							</el-row>
						</template>
					</el-autocomplete>
				</el-form-item>
				<el-form-item label="期刊名" prop="bookName">
					<el-input v-model="form.bookName" placeholder="请输入期刊名" />
				</el-form-item>
				<el-form-item label="期刊类型" prop="bookType">
					<el-select v-model="form.bookType" placeholder="请选择期刊类型">
						<el-option v-for="dict in bookTypeOptions" :key="dict.dictValue" :label="dict.dictLabel"
							:value="dict.dictValue"></el-option>
					</el-select>
				</el-form-item>
				<el-form-item label="出版日期" prop="bookPubDate">
					<el-date-picker clearable size="small" v-model="form.bookPubDate" type="date"
						value-format="yyyy-MM-dd" placeholder="选择出版日期">
					</el-date-picker>
				</el-form-item>
				<el-form-item label="上传日期" prop="bookUpDate">
					<el-date-picker clearable size="small" v-model="form.bookUpDate" type="date"
						value-format="yyyy-MM-dd" placeholder="选择上传日期">
					</el-date-picker>
				</el-form-item>
				<el-form-item label="出版社" prop="bookPress">
					<el-input v-model="form.bookPress" placeholder="请输入出版社" />
				</el-form-item>
				<el-form-item label="期刊封面">
					<imageUpload v-model="form.bookCover" :limit="1" />
				</el-form-item>
				<el-form-item label="期刊pdf">
					<fileUpload v-model="form.bookPdfUrl" :fileType="['pdf']" :limit="1" :fileSize="20"/>
				</el-form-item>
				<el-form-item label="审核状态" prop="bookAudit">
					<el-select v-model="form.bookAudit" placeholder="请选择审核状态">
						<el-option v-for="dict in bookAuditOptions" :key="dict.dictValue" :label="dict.dictLabel"
							:value="parseInt(dict.dictValue)"></el-option>
					</el-select>
				</el-form-item>
			</el-form>
			<div slot="footer" class="dialog-footer">
				<el-button type="primary" @click="submitForm">确 定</el-button>
				<el-button @click="cancel">取 消</el-button>
			</div>
		</el-dialog>
	</div>
</template>

<script>
	import {
		listBooks,
		getBooks,
		delBooks,
		addBooks,
		updateBooks,
		exportBooks
	} from "@/api/bookM/books";
	import {
		listWriter
	} from "@/api/writer/writer";

	export default {
		name: "Books",
		data() {
			return {
				//作者
				restaurants: [],
				baseUrl: process.env.VUE_APP_BASE_API,
				// 遮罩层
				loading: true,
				// 导出遮罩层
				exportLoading: false,
				// 选中数组
				ids: [],
				// 非单个禁用
				single: true,
				// 非多个禁用
				multiple: true,
				// 显示搜索条件
				showSearch: true,
				// 总条数
				total: 0,
				// 期刊管理表格数据
				booksList: [],
				// 弹出层标题
				title: "",
				// 是否显示弹出层
				open: false,
				// 期刊类型字典
				bookTypeOptions: [],
				// 审核状态字典
				bookAuditOptions: [],
				// 出版日期时间范围
				daterangeBookPubDate: [],
				// 上传日期时间范围
				daterangeBookUpDate: [],
				// 查询参数
				queryParams: {
					pageNum: 1,
					pageSize: 10,
					bookWriterName: null,
					bookName: null,
					bookType: null,
					bookPubDate: null,
					bookUpDate: null,
					bookPress: null,
				},
				// 表单参数
				form: {},
				// 表单校验
				rules: {}
			};
		},
		mounted() {
			this.loadAll();
		},
		created() {
			this.getList();
			this.getDicts("book_type").then(response => {
				this.bookTypeOptions = response.data;
			});
			this.getDicts("book_audit").then(response => {
				this.bookAuditOptions = response.data;
			});
		},
		methods: {
			/*作者姓名提示*/
			querySearch(queryString, cb) {
				var restaurants = this.restaurants;
				var results = queryString ? restaurants.filter(this.createFilter(queryString)) : restaurants;
				// 调用 callback 返回建议列表的数据
				cb(results);
			},
			createFilter(queryString) {
				return (restaurant) => {
					return (restaurant.writerName.indexOf(queryString) === 0)
				};

			},
			handleSelect(item) {
				this.form.bookWriterName = item.writerName
			},
			handleQueryParams(item) {
				this.queryParams.bookWriterName = item.writerName
			},
			//获取作者列表
			loadAll() {
				listWriter(this.queryParams).then(response => {
					this.restaurants = response.rows;
				});
			},

			/** 查询期刊管理列表 */
			getList() {
				this.loading = true;
				this.queryParams.params = {};
				if (null != this.daterangeBookPubDate && '' != this.daterangeBookPubDate) {
					this.queryParams.params["beginBookPubDate"] = this.daterangeBookPubDate[0];
					this.queryParams.params["endBookPubDate"] = this.daterangeBookPubDate[1];
				}
				if (null != this.daterangeBookUpDate && '' != this.daterangeBookUpDate) {
					this.queryParams.params["beginBookUpDate"] = this.daterangeBookUpDate[0];
					this.queryParams.params["endBookUpDate"] = this.daterangeBookUpDate[1];
				}
				listBooks(this.queryParams).then(response => {
					this.booksList = response.rows;
					this.total = response.total;
					this.loading = false;
				});
			},
			// 取消按钮
			cancel() {
				this.open = false;
				this.reset();
			},
			// 表单重置
			reset() {
				this.form = {
					bookId: null,
					bookWriterName: null,
					bookName: null,
					bookType: null,
					bookPubDate: null,
					bookUpDate: null,
					bookPress: null,
					bookCover: null,
					bookPdfUrl: null,
					bookAudit: null
				};
				this.resetForm("form");
			},
			/** 搜索按钮操作 */
			handleQuery() {
				this.queryParams.pageNum = 1;
				this.getList();
			},
			/** 重置按钮操作 */
			resetQuery() {
				this.daterangeBookPubDate = [];
				this.daterangeBookUpDate = [];
				this.resetForm("queryForm");
				this.handleQuery();
			},
			// 多选框选中数据
			handleSelectionChange(selection) {
				this.ids = selection.map(item => item.bookId)
				this.single = selection.length !== 1
				this.multiple = !selection.length
			},
			/** 新增按钮操作 */
			handleAdd() {
				this.reset();
				this.open = true;
				this.title = "添加期刊管理";
			},
			/** 修改按钮操作 */
			handleUpdate(row) {
				this.reset();
				const bookId = row.bookId || this.ids
				getBooks(bookId).then(response => {
					this.form = response.data;
					this.open = true;
					this.title = "修改期刊管理";
				});
			},
			/** 提交按钮 */
			submitForm() {
				this.$refs["form"].validate(valid => {
					if (valid) {
						if (this.form.bookId != null) {
							updateBooks(this.form).then(response => {
								this.msgSuccess("修改成功");
								this.open = false;
								this.getList();
							});
						} else {
							addBooks(this.form).then(response => {
								this.msgSuccess("新增成功");
								this.open = false;
								this.getList();
							});
						}
					}
				});
			},
			/** 删除按钮操作 */
			handleDelete(row) {
				const bookIds = row.bookId || this.ids;
				this.$confirm('是否确认删除期刊管理编号为"' + bookIds + '"的数据项?', "警告", {
					confirmButtonText: "确定",
					cancelButtonText: "取消",
					type: "warning"
				}).then(function() {
					return delBooks(bookIds);
				}).then(() => {
					this.getList();
					this.msgSuccess("删除成功");
				}).catch(() => {});
			},
			/** 导出按钮操作 */
			handleExport() {
				const queryParams = this.queryParams;
				this.$confirm('是否确认导出所有期刊管理数据项?', "警告", {
					confirmButtonText: "确定",
					cancelButtonText: "取消",
					type: "warning"
				}).then(() => {
					this.exportLoading = true;
					return exportBooks(queryParams);
				}).then(response => {
					this.download(response.msg);
					this.exportLoading = false;
				}).catch(() => {});
			}
		}
	};
</script>
