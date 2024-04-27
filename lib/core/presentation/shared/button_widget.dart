import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vascomm_flutter_technical_assessment/common/themes/app_colors.dart';
import 'package:vascomm_flutter_technical_assessment/common/themes/app_size.dart';
import 'package:vascomm_flutter_technical_assessment/common/themes/app_styles.dart';
import 'package:vascomm_flutter_technical_assessment/core/presentation/shared/assets_widget.dart';

class CommonButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final bool isLoading;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final Color? buttonColor;
  final Color? outlineColor;
  final String? iconName;
  final bool iconIsImage;
  final bool isEnable;
  final Color? textColor;

  const CommonButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.buttonColor,
    this.width,
    this.borderRadius,
    this.outlineColor,
    this.iconName,
    this.iconIsImage = false,
    this.isLoading = false,
    this.isEnable = true,
    this.textColor,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        onTap: isEnable ? onTap : null,
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          width: width,
          decoration: BoxDecoration(
            color: buttonColor ?? (isEnable ? AppColors.primaryAccent : AppColors.disableButton),
            borderRadius: borderRadius ??
                const BorderRadius.all(
                  Radius.circular(AppSize.dimen12),
                ),
            border: Border.all(
              color: outlineColor ?? (isEnable ? AppColors.primaryAccent : AppColors.disableButton),
              width: 1,
            ),
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: iconName != null ? 24 : 17,
                    width: iconName != null ? 24 : 17,
                    child: Platform.isAndroid ? CircularProgressIndicator(color: AppColors.neutralWhite) : CupertinoActivityIndicator(color: AppColors.neutralWhite),
                  )
                : Stack(
                    children: [
                      Align(
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.rubik(
                            textStyle: textStyleW600S16,
                            color: isEnable ? textColor ?? AppColors.neutralWhite : AppColors.disableButtonText,
                          ),
                        ),
                      ),
                      if (iconName != null) ...[
                        Positioned(
                          right: 8,
                          child: SvgAssets.asset(assetName: iconName ?? ''),
                        ),
                      ],
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class TransparentButtonWidget extends StatelessWidget {
  final void Function() onTap;
  final String? title;
  final String assetName;

  const TransparentButtonWidget({
    super.key,
    required this.onTap,
    required this.assetName,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        width: double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.otherPrimary,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BPIcon.asset(assetName: assetName),
            title != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      title ?? '',
                      style: GoogleFonts.rubik(
                        textStyle: textStyleW500S14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class ButtonWithBgColor extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final bool isWithIcon;
  final Color? borderColor, titleColor;
  const ButtonWithBgColor({
    super.key,
    required this.onTap,
    required this.title,
    this.borderColor,
    this.titleColor,
    this.isWithIcon = false,
    this.width,
    this.borderRadius,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          width: width,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor ?? AppColors.primaryAccent,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
            color: AppColors.background,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rubik(
                    textStyle: textStyleW500S12,
                    color: titleColor ?? AppColors.primaryAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final Color? buttonColor;
  const CancelButton({
    super.key,
    required this.onTap,
    required this.title,
    this.width,
    this.borderRadius,
    this.buttonColor,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          width: width,
          decoration: BoxDecoration(
            color: buttonColor ?? AppColors.backgroundSurfaceThree,
            borderRadius: borderRadius ??
                const BorderRadius.all(
                  Radius.circular(4),
                ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rubik(
                    textStyle: textStyleW500S14,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonWithCustomIcon extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final String assetName;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsets? padding;
  final Color? buttonColor;
  final Color? textColor;

  const ButtonWithCustomIcon({
    super.key,
    required this.onTap,
    required this.title,
    required this.assetName,
    this.width,
    this.borderRadius,
    this.padding,
    this.buttonColor,
    this.textColor,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        onTap: onTap,
        child: Ink(
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
          width: width,
          decoration: BoxDecoration(
            color: buttonColor ?? AppColors.backgroundSurfaceThree,
            borderRadius: borderRadius ??
                const BorderRadius.all(
                  Radius.circular(4),
                ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // BPIcon.asset(assetName: assetName),
              const SizedBox(width: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.rubik(
                  textStyle: textStyleW500S12,
                  color: textColor ?? AppColors.primaryAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
