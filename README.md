

# 项目介绍

如果你停止，就是谷底。如果你还在继续，就是上坡。这是我听过关于人生低谷最好的阐述。借此我做了一个在线阅读平台，
使现代人可以利用碎片化来阅读。并且设计加入了社区功能，使得用户可以一起讨论阅读心得，并发表在社区里，产生一个生态闭环，实现用户快速裂变。

* 所有使用到的框架或者组件都是基于开源项目，代码保证100%开源。
* 系统功能通用，无论是个人还是企业都可以利用该系统快速搭建一个属于自己的阅读 or 社区系统。

这是项目，分为三个平台

1. 后台管理平台 (期刊管理模块  :heavy_plus_sign: 读者管理模块 :heavy_plus_sign: 创作者管理模块 :heavy_plus_sign: 社区管理模块）
2. 前台阅读平台 (阅读模块  :heavy_plus_sign: 社区模块 :heavy_plus_sign: 创作者模块）
3. 小程序社区平台  (阅读模块  :heavy_plus_sign: 社区模块 ）



# :tw-1f4cf: 准备工作

    JDK >= 1.8 (推荐1.8版本)
    Mysql >= 5.7.0 (推荐5.7版本)
    Redis >= 3.0
    Maven >= 3.0
    Node >= 12

# :tw-1f4cb: 运行流程

1. 把仓库 v2.0 分支 clone下来</br>
   `git clone -b v2.0 https://gitee.com/cxq21/book.git`(指定v2.0分支)
   或fork到你自己的仓库

2. 使用idea打开项目，并加载Maven依赖

3. 创建数据库sq_book并依次导入数据脚本
    1. sq_book.sql
    2. quartz.sql

4. 启动 redis 服务 （redis免安装版链接：https://pan.baidu.com/s/1MYmNxiY8JIOuXjVr0W_-5A 提取码：1234）

5. 配置 application.yml 里的 redis 信息，和 application-druid.yml 里的数据库信息

6. 启动项目，启动成功后访问 http://localhost:8080/

7. 再用idea单独打开sq-ui 执行</br>

   `npm install`

   `npm run dev`

8. 访问 http://localhost:80 默认账户/密码 admin/admin123

# :tw-1f4cb: 小程序运行流程

### 准备工作


 如果使用小程序项目，在此基础上希望得到最大化的效率工具支持，那么HBuilderX是你的首选。

1、首先访问HBuilderX的官网网址：(https://www.dcloud.io/hbuilderx.html (opens new window))

2、打开上面的HBuilderX下载网址后点击页面上download，在弹出的对话框里选择适合自己电脑的HBuilderX版本下载。

3、在Windows10环境下下载后的文件是一个压缩的.zip文件，解压后双击运行HBuilderX.exe即可启动编辑器。

redis下载配置并简单测试（免安装版）
https://blog.csdn.net/weixin_45931372/article/details/123572426

### 运行系统

`前置条件，需要先启动后端。`

1、点击HBuilderx，菜单 文件 -> 打开目录，然后选择sq-app项目，点击选择文件夹按钮，即可成功导入。

2、点击HBuilderx，菜单 运行 -> 运行到浏览器，然后选择浏览器类型，即可在浏览器里面访问。(也可小程序运行，自行百度)

3、运行成功可以通过(http://localhost:9090 (opens new window))访问，出现如下图页面表示成功运行。
<img style="height:50%" src="https://gitee.com/cxq21/book/raw/v2.0/assets/img/img5.jpg"/>


