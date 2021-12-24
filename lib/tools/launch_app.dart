import 'package:get/get.dart';
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
  launchApp(
      'mqqapi://card/show_pslcard?src_type=internal&version=1&uin=${212547143}&card_type=group&source=qrcode',
      'wechat_error'.tr);
}

launchTwitter() {
  launchApp('weixin://yjh123weixin', 'wechat_error'.tr);
}

launchEmail() {
  launchApp(
      Uri(
          scheme: 'mailto',
          path: '1611641037@qq.com',
          query: encodeQueryParameters({
            'subject': 'feedback'.tr,
          })).toString(),
      'email_error'.tr);
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
