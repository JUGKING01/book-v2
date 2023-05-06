<template>
  <div style="margin-left: 80px">
    <el-row :gutter="40">
      <el-col :span="14">
        <el-carousel :interval="4000" type="card" height="200px">
          <el-carousel-item v-for="item in PPTList" :key="item.pptId" :label="item.pptName">
            <el-tooltip class="item" effect="dark" :content="item.pptName" placement="right">
              <el-image :src="baseUrl+item.pptPic" @click="jump(1,item)"></el-image>
            </el-tooltip>
          </el-carousel-item>
        </el-carousel>
      </el-col>
      <el-col :span="10">
        <h1>实 时 最 热 榜 单
          <el-tooltip class="item" effect="dark" content="一 分 钟 更 新 一 次 榜 单" placement="bottom">
            <i class="el-icon-info" style="font-size: 18px"></i>
          </el-tooltip>
        </h1>
                <div v-for="item in 6" :key="item" style="height: 30px;">
                  <span>{{ item }} 青春是一个短暂的美梦, 当你醒来时, 它早已消失无踪
                    <el-badge value="热" v-show="item<=3">
                      <i class="el-icon-trophy" style="color: red;"></i>
                    </el-badge>

                  </span>
                </div>
      </el-col>
    </el-row>
    <el-divider></el-divider>

    <h1><i class="el-icon-s-opportunity" style="color:rgb(48, 176, 143)"></i> 推荐</h1>
    <el-row :gutter="20">
      <el-col :span="8" v-for="(o, index) in 3" :key="index">
        <el-card :body-style="{ padding: '0px'}" shadow="hover">
          <el-row>
            <el-col :span="12">
              <el-image
                  style="width: 180px;border-radius: 4px"
                  fit="cover"
                  src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"></el-image>
            </el-col>
            <el-col :span="12">
              <div>
                <h3>期刊名</h3>
                <p>作者</p>
                <p>简介</p>
                <el-link style="position: relative;top: 25px">立即阅读 ></el-link>
              </div>
            </el-col>
          </el-row>
        </el-card>
      </el-col>
    </el-row>

    <el-row>
      <el-col :span="14">
        <h1><i class="el-icon-s-management" style="color:rgb(48,176,143)"></i> 书库</h1>
      </el-col>
      <el-col :span="9">
        <el-link style="margin-top: 10px"><h1>更多>>></h1></el-link>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="16">
        <el-row>
          <el-col :span="12" v-for="(o, index) in booksList" :key="index">
            <el-card :body-style="{ padding: '0px'}" shadow="hover">
              <el-row>
                <el-col :span="12">
                  <el-image
                      style="width: 180px;height:200px;border-radius: 4px"
                      fit="cover"
                      :src="baseUrl+o.bookCover"></el-image>
                </el-col>
                <el-col :span="12">
                  <div>
                    <h3>{{ o.bookName }}</h3>
                    <p>{{ o.bookWriterName }} 著</p>
                    <p>分类：{{ o.bookType }}</p>
                    <p> 更新时间：{{ o.bookUpDate }}</p>
                    <el-link style="position: relative;top: 10px" @click="jump(2,o)">立即阅读 ></el-link>
                  </div>
                </el-col>
              </el-row>
            </el-card>
          </el-col>
        </el-row>
      </el-col>
      <el-col :span="8">
        <h1>书库阅读总榜</h1>
        <div v-for="(item,index) in readAllRankList" :key="item.bookId" style="height: 30px;">
          <div v-show="index === 0">
            <el-badge value="NO.1">
              <el-card :body-style="{ padding: '0px'}" shadow="hover">
                <el-row>
                  <el-col :span="12">
                    <el-image
                        style="width: 120px;height:160px;border-radius: 4px"
                        fit="cover"
                        :src="baseUrl+item.bookCover"></el-image>
                  </el-col>
                  <el-col :span="12">
                    <div style="width: 200px">
                      <h3>{{ item.bookName }}</h3>
                      <p>{{ item.bookWriterName }} 著</p>
                      <p>分类：{{ item.bookType }}</p>
                      <el-link @click="jump(2,item)">立即阅读 ></el-link>
                    </div>
                  </el-col>
                </el-row>
              </el-card>
            </el-badge>
          </div>
          <div v-show="index>0" style="position: relative;top: 160px;font-size: 18px;">
            <el-link @click="jump(2,item)">
              NO.{{ index + 1 }} {{ item.bookName }} <i v-show="index<=2" class="el-icon-trophy"
                                                        style="color: red;"></i></el-link>
          </div>
        </div>
      </el-col>
    </el-row>

    <el-divider></el-divider>
    <h1><i class="el-icon-star-on" style="color:rgb(48,176,143)"></i> 猜你喜欢</h1>
    <el-row :gutter="20">
      <el-col :span="8" v-for="(o, index) in 3" :key="index">
        <el-card :body-style="{ padding: '0px'}" shadow="hover">
          <el-row>
            <el-col :span="12">
              <el-image
                  style="width: 180px;border-radius: 4px"
                  fit="cover"
                  src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"></el-image>
            </el-col>
            <el-col :span="12">
              <div>
                <h3>期刊名</h3>
                <p>作者</p>
                <p>简介</p>
                <el-link style="position: relative;top: 25px">立即阅读 ></el-link>
              </div>
            </el-col>
          </el-row>
        </el-card>
      </el-col>
    </el-row>

    <el-divider></el-divider>
    <h1><i class="el-icon-s-flag" style="color:rgb(48,176,143)"></i> 关于爱阅读</h1>
    <el-row :gutter="20">
      <el-col :span="8">
        <el-card shadow="hover">
          <el-row>
            <el-col :span="6">
              <i class="el-icon-mobile-phone" style="font-size: 60px;margin-top: 50px"></i>
            </el-col>
            <el-col :span="18">
              <div>
                <h3>爱阅读小程序</h3>
                <p>最走心的阅读产品</p>
                <p style="font-size: 12px"><em>关注我们：
                  <el-link href="https://space.bilibili.com/457574535?spm_id_from=333.788.0.0"
                           style="padding-right:5px ">哔哩哔哩
                  </el-link>
                  <el-link href="https://gitee.com/cxq21">Gitee</el-link>
                </em></p>
                <el-tooltip class="item" effect="dark" placement="top">
                  <div slot="content">
                    <h3>打开微信扫一扫,即刻体验小程序</h3>
                    <el-image
                        src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                        style="width: 200px;height: 200px">
                    </el-image>
                  </div>
                  <el-link style="color: #30B08F">点我 ></el-link>
                </el-tooltip>
              </div>
            </el-col>
          </el-row>
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card shadow="hover">
          <el-row>
            <el-col :span="6">
              <i class="el-icon-edit-outline" style="font-size: 60px;margin-top: 50px"></i>
            </el-col>
            <el-col :span="18">
              <div>
                <h3>创作中心</h3>
                <p>原创、自媒体、内容商、漫画、期刊</p>
                <p style="font-size: 12px"><em>招募作者，福利优厚</em></p>
                <router-link target="_blank" to="/index">
                  <el-link style="color: #30B08F">投稿 ></el-link>
                </router-link>

              </div>
            </el-col>
          </el-row>
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card shadow="hover">
          <el-row>
            <el-col :span="6">
              <i class="el-icon-chat-dot-round" style="font-size: 60px;margin-top: 50px"></i>
            </el-col>
            <el-col :span="18">
              <div>
                <h3>QQ交流群</h3>
                <p>欢迎反馈宝贵意见给我们</p>
                <p style="font-size: 12px"><em>QQ群：870299711</em></p>
                <el-link href="https://jq.qq.com/?_wv=1027&k=qzPRU17T" style="color: #30B08F">加入 ></el-link>
              </div>
            </el-col>
          </el-row>
        </el-card>
      </el-col>
    </el-row>

    <el-backtop :bottom="100" :visibility-height="100">
      <div
          style="{
        height: 100%;
        width: 100%;
        background-color: #f2f5f6;
        box-shadow: 0 0 6px rgba(0,0,0, .12);
        text-align: center;
        line-height: 40px;
        color: rgb(48, 176, 143);
      }"
      >
        <i class="el-icon-s-promotion"></i>
      </div>
    </el-backtop>
  </div>
</template>

<script>
import {indexBooks, indexPpt, readAllRank} from "../../../api/pub/index";

export default {
  name: "cmsIndex",

  data() {
    return {
      baseUrl: process.env.VUE_APP_BASE_API,
      PPTList: [],
      booksList: [],
      readAllRankList: [],
    };
  },
  created() {
    this.getPPT()
    this.getRank()
    this.getBooksList()
  },
  methods: {
    ellipsis(value) {
      if (!value) return "";
      if (value.length > 10) {
        return value.slice(0, 10) + "...";
      }
      return value;
    },
    getPPT() {
      let obj = {};
      obj.pptDesc = 1
      indexPpt(obj).then(res => {
        this.PPTList = res.rows
      })
    },
    getBooksList() {
      let obj = {};
      obj.pageNum = 1
      obj.pageSize = 4
      indexBooks(obj).then(res => {
        this.booksList = res.rows
      })
    },
    getRank() {
      readAllRank().then(res => {
        this.readAllRankList = res.rows
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
        case 2:
          let routeUrl = this.$router.resolve({
            path: '/cms/main/cmsDetail',
            query: {
              pptUrl: parm.bookId
            }
          })
          window.open(routeUrl.href, '_blank')
          break

      }
    }
  }
};
</script>

<style scoped>
#sector {
  width: 100%;
  height: 100px;
  margin: 0 auto;
}
</style>
