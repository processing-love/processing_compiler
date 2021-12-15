import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// @author u
/// @date 2020/6/12.
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CupertinoActivityIndicator().marginOnly(bottom: 12),
        Text('loading'.tr)
      ],
    );
  }
}
