import 'dart:io';

import 'package:get/get.dart';
import 'package:processing_compiler/devices/third_platform.dart';
import 'package:processing_compiler/widgets/dialog.dart';
import 'package:url_launcher/url_launcher.dart';

/// @author u
/// @date 2020/6/12.

launchApp(String url, String errorMessage) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    showTalkErrorDialog(errorMessage);
  }
}

launchQQ() {
  launchApp('mqqapi://card/show_pslcard?src_type=internal&version=1&uin=${212547143}&card_type=group&source=qrcode', 'qq_error'.tr);
}

launchEmail() {
  launchApp(
      Uri(
        scheme: 'mailto',
        path: '1611641037@qq.com',
      ).toString(),
      'email_error'.tr);
}

launchMarket() {
  if (Platform.isAndroid) {
    launchApp('market://details?id=com.processing.compiler', 'open_error'.tr);
  } else {
    launchApp('https://itunes.apple.com/us/app/twitter/id${ThirdPlatform.appStoreAppId}?mt=8&action=write-review', 'open_error'.tr);
  }
}
