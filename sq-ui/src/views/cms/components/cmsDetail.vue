<template>
  <div style="padding: 0 100px">

    <el-row>
      <el-col :span="20" style="padding: 0 40px">
        <div style="float: left;padding-right: 30px">
          <el-image :src="baseUrl+detail.bookCover" style="width: 180px;height: 250px" fit="cover"></el-image>
        </div>
        <div>
          <p style="font-weight: bold;font-size: 28px">{{ detail.bookName }}</p>
          <p style="color: #5a5e66;font-size: 20px">{{ detail.bookWriterName }} 著 <i>{{ detail.bookPress }} 出版</i></p>
          <p style="font-style: italic;color: #5a5e66">分类： {{ detail.bookType }}</p>
          <p style="font-style: italic;color: #5a5e66">发布于： {{ detail.bookPubDate }}</p>
          <p style="font-style: italic;color: #5a5e66">最近更新： {{ detail.bookUpDate }}</p>
        </div>
        <div style="position: absolute;top:10px;right: 30%">
          <el-button type="danger" round @click="read">立即阅读</el-button>
          <el-button type="danger" plain round>加入书架</el-button>
          <el-tooltip class="item" effect="dark">
            <div slot="content">
              <h3>打开微信扫一扫,即刻体验小程序</h3>
              <el-image
                  src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                  style="width: 200px;height: 200px">
              </el-image>
            </div>
            <el-link style="color: #30B08F;margin-left: 10px"><i class="el-icon-mobile"></i> 小程序阅读</el-link>
          </el-tooltip>
          <i class="el-icon-star-off" v-show="starShow"
             style="font-size: 30px;position: relative;top: 5px;right: -10px;color: grey" @click="star(1)"></i>
          <i class="el-icon-star-on" v-show="!starShow"
             style="font-size: 30px;position: relative;top: 5px;right: -10px;color: #ff0000" @click="star(0)"></i>
        </div>

        <div class="ql-container ">
          <div class="ql-editor" v-html="detail.newsDetail"/>
        </div>
        <el-divider></el-divider>
        <div>
          <i style="font-size: 20px; color: red" class="el-icon-chat-dot-round"><span style="color: black"
          > 评论</span></i>
          <el-divider></el-divider>
          <el-form ref="form" :model="form" label-width="80px">
            <el-form-item label="发表评论">
              <el-input type="textarea" v-model="form.commentDetail"></el-input>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="onSubmit">发表</el-button>
            </el-form-item>
          </el-form>
          <el-divider></el-divider>
          <div v-for="item in commentList" :key="item.commentId">
            <i style="font-size: 16px; color: red" class="el-icon-user"> <span style="color: black"
            >{{ item.commentByUser || ' 游客' }}</span></i>
            <span style="font-style: italic;color: #5a5e66"> {{ item.commentTime }}</span>
            <p style="padding-left: 20px">{{ item.commentDetail }}</p>
            <el-divider></el-divider>
          </div>
          <p style="padding-left: 20px" v-if="commentListTotal === 0">暂无评论</p>

          <el-button type="text" style="float: right;color: red;"
                     v-if="commentListTotal >= 5"
                     @click="commentMore"
          ><i class="el-icon-d-arrow-right"></i> 更多
          </el-button>
        </div>
      </el-col>


      <el-col :span="4">
        <el-card :body-style="{ padding: '0px' }" v-if="isAds">
          <i class="el-icon-circle-close"
             style="position: absolute;right:10px;top:5px;font-size: 20px;color: red;z-index: 1024"
             @click="isAds = false"
          />
          <el-carousel height="200px" direction="vertical">
            <el-carousel-item v-for="item in PPTList" :key="item.pptId">
              <div @click="jump(1,item)">
                <el-image :src="baseUrl + item.pptPic"
                          fit="cover"
                          style="width: 210px"
                />
                <p style="padding-left: 5px">{{ item.pptName }}</p>
              </div>
            </el-carousel-item>
          </el-carousel>

        </el-card>
        <el-divider></el-divider>
        <el-card :body-style="{ padding: '0px' }">
          <div style="padding: 14px;">
            <el-image :src="this.baseUrl+writerInfo.writerPic"
                      style="border-radius: 100px;width: 100px;margin-left: 20%;"></el-image>
            <div style="text-align: center">
              <h3>{{ this.writerInfo.writerName }}</h3>
              <p>{{ this.writerInfo.writerIntro }}</p>
            </div>
            <el-divider></el-divider>
            <h3>作者其他作品</h3>
            <el-tooltip v-for="item in writerOtherBooks" :key="item.newsId" class="item" effect="dark"
                        :content="item.bookName"
                        placement="left-start"
            >
              <div @click="toDetail(item)">
                <el-card shadow="hover">
                  {{ item.bookName | ellipsis }}
                </el-card>
              </div>
            </el-tooltip>
          </div>
        </el-card>
      </el-col>
    </el-row>

  </div>
</template>

<script>
import {addRankParm, getDetail, getWriterInfo, ListBook} from "../../../api/pub/detail";
import {indexPpt} from "../../../api/pub/index";

export default {
  filters: {
    ellipsis(value) {
      if (!value) return ''
      if (value.length > 9) {
        return value.slice(0, 9) + '...'
      }
      return value
    }
  },

  data() {
    return {
      isAds: true,
      starShow: true,
      starYesShow: false,
      commentListTotal: 0,
      baseUrl: process.env.VUE_APP_BASE_API,
      detail: {},
      writerInfo: {},
      form: {
        newsId: null,
        commentTime: 1,
      },
      writerOtherBooks: [],
      PPTList: [],
      commentList: [],
      queryParames: {
        newsFormBoxer: null,
        pageNum: 1,
        pageSize: 4
      },
      queryCommentParames: {
        pageNum: 1,
        pageSize: 5,
        newsId: null
      }
    }
  },

  created() {
    this.getDetailInfo()
    this.getPPT()
  },

  methods: {
    star(type) {
      if (type === 1) {
        this.$message.success("已喜欢")
        this.starShow = false
      } else {
        this.$message.warning("取消喜欢")
        this.starShow = true
      }
    },
    read() {
      const data = {};
      data.readNum = 1
      data.bookId = this.detail.bookId
      addRankParm(data).then(res => {
        window.open(this.baseUrl + this.detail.bookPdfUrl, '_blank')
      })
    },
    getPPT() {
      let obj = {};
      obj.pptDesc = 1
      indexPpt(obj).then(res => {
        this.PPTList = res.rows
      })
    },
    jump(type, parm) {
      switch (type) {
          //幻灯片
        case 1:
          if (parm.pptType === 1) {
            let routeUrl = this.$router.resolve({
              path: '/cms/main/cmsDetail',
              query: parm
            })
            window.open(routeUrl.href, '_blank')
          }
          if (parm.pptType === 2 || parm.pptType === 3) {
            window.open(parm.pptUrl, '_blank');
          }
          break

      }
    },
    getDetailInfo() {
      getDetail(this.$route.query.pptUrl).then(res => {
        this.detail = res.data
        var obj = {}
        obj.bookWriterName = this.detail.bookWriterName
        obj.writerName = this.detail.bookWriterName
        getWriterInfo(obj).then(res => {
          this.writerInfo = res.rows[0]
        })
        ListBook(obj).then(res => {
          this.writerOtherBooks = res.rows
        })
      })
    },
    toDetail(parm) {
      let routeUrl = this.$router.resolve({
        path: '/cms/main/cmsDetail',
        query: {
          pptUrl: parm.bookId
        }
      })
      window.open(routeUrl.href, '_blank')
    },
    commentMore() {
      this.queryCommentParames.pageSize += 5

    },
    onSubmit() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.newsId = this.detail.newsId

        }
      });
    },
  }

}
</script>

<style scoped>

</style>
