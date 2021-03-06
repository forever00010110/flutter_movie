import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie/ui/common/app_navigator.dart';
import 'package:flutter_movie/ui/common/common_my_item_view.dart';
import 'package:flutter_movie/ui/my/my_head_image.dart';
import 'package:provider_mvvm/common/app_color.dart';
import 'package:provider_mvvm/utils/screen_util.dart';
import 'package:provider_mvvm/utils/toast_util.dart';

import 'asr_page.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyPageState();
  }
}

class MyPageState extends State<MyPage> with RouteAware {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.updateStatusBarStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: Container(
        color: AppColor.white,
        child: ListView(
          padding: EdgeInsets.only(top: 0),
          children: <Widget>[
            MyHeadImage(),
            CommonMyItemView('icon_github.png', '项目地址', clickProject),
            CommonMyItemView('icon_qq.png', 'Flutter技术群', clickQQChat),
            CommonMyItemView('icon_wechat.png', '我的微信号', clickWeChat),
            CommonMyItemView('icon_account.png', '我的公众号', clickAccount),
            CommonMyItemView('icon_api.png', 'API文档', clickApi),
            buildAsr(),
          ],
        ),
      ),
    );
  }

  Widget buildAsr() {
    if (Platform.isAndroid) {
      return CommonMyItemView('icon_api.png', '语音识别', clickAsr);
    } else {
      return Container();
    }
  }

  /// 语音识别
  void clickAsr() {
    Navigator.push(context, new CupertinoPageRoute(builder: (context) {
      return AsrPage();
    }));
  }

  // 项目地址
  void clickProject() {
    String url = 'https://github.com/zlc921022/flutter_movie';
    AppNavigator.pushWebView(context, url: url, title: '项目地址');
  }

  // 技术交流
  void clickQQChat() {
    Clipboard.setData(ClipboardData(text: '1509815887'));
    ToastUtil.show('qq已拷贝');
  }

  // 微信
  void clickWeChat() {
    Clipboard.setData(ClipboardData(text: '1509815887'));
    ToastUtil.show('微信已拷贝');
  }

// 我的公众号
  void clickAccount() {
    Clipboard.setData(ClipboardData(text: '1509815887'));
    ToastUtil.show('公众号已拷贝');
  }

// API文档
  void clickApi() {
    String url = 'https://github.com/Mayandev/morec/blob/master/API.md';
    AppNavigator.pushWebView(context, url: url, title: 'API文档');
  }
}
