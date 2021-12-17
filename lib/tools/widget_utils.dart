import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/page/home/state.dart';

/// @author u
/// @date 2020/6/12.

void wrapGetBottomSheet(Widget widget) {
  Get.bottomSheet(
      Container(
        margin: !useMobileLayout
            ? EdgeInsets.all(Get.width * 0.18)
            : EdgeInsets.symmetric(
                vertical: Platform.isAndroid ? 14 : 48, horizontal: 14),
        decoration: BoxDecoration(
            color: Get.theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(7))),
        child: widget,
      ),
      ignoreSafeArea: false);
}
