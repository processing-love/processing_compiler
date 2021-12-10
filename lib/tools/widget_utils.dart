import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// @author u
/// @date 2020/6/12.

void wrapGetBottomSheet(Widget widget) {
  Get.bottomSheet(
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 48),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: widget,
      ),
      barrierColor: Colors.black38);
}
