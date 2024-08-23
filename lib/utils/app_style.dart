import 'dart:ui';

import 'package:flutter/material.dart';

import 'size_config.dart';

class AppStyle {
  static TextStyle styleBold20(context) {
    return TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Merriweather',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold40(context) {
    return TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: getResponsiveFontSize(context, fontSize: 40),
      fontFamily: 'Merriweather',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold30(context) {
    return TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: getResponsiveFontSize(context, fontSize: 30),
      fontFamily: 'Merriweather',
      fontWeight: FontWeight.w700,
    );
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 450;
  } else if (width < SizeConfig.desktop) {
    return width / 800;
  } else {
    return width / 1920;
  }
}
