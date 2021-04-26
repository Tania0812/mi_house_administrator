import 'package:flutter/material.dart';
import 'package:mi_house_administrator/core/util/app_state.dart';

class Responsive {
  static double homeWidth() {
    final size = MediaQuery.of(appContext.getContext).size;
    final bool isLarge = size.width > 1024;
    return isLarge ? size.width - 270 : size.width - 170;
  }

  static bool isLarge() {
    final size = MediaQuery.of(appContext.getContext).size;
    return size.width > 1024;
  }
}
