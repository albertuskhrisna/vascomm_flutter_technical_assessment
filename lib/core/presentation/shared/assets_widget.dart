import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vascomm_flutter_technical_assessment/common/constants/app_strings.dart';

class SvgAssets {
  static Widget asset({
    required String assetName,
    double? width,
    double? height,
    // Color? color,
    BoxFit? fit,
  }) {
    return SvgPicture.asset(
      '${AppStrings.svgPath}$assetName.svg',
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
    );
    // return Image.asset(
    //   '${AppStrings.svgPath}$assetName.svg',
    //   width: width,
    //   height: height,
    //   color: color,
    //   fit: fit ?? BoxFit.cover,
    // );
  }
}
