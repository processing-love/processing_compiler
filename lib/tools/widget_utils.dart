import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// @author u
/// @date 2020/6/12.

void wrapGetBottomSheet(Widget widget) {
  Get.bottomSheet(
      Container(
        margin: EdgeInsets.symmetric(vertical: Platform.isAndroid ? 14 : 48, horizontal: 14),
        decoration: BoxDecoration(
            color: Get.theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(7))),
        child: widget,
      ),
      ignoreSafeArea: false);
}
