import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vascomm_flutter_technical_assessment/common/themes/app_colors.dart';
import 'package:vascomm_flutter_technical_assessment/common/themes/app_size.dart';
import 'package:vascomm_flutter_technical_assessment/common/themes/app_styles.dart';

class CommonAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final double? appBarHeight;
  final Color? backgroundColor;
  final ShapeBorder? shapeBorder;
  final Widget? content;
  final Widget? bottom;
  final double? elevation;
  final String? leadingIcon;

  const CommonAppBarWidget({
    super.key,
    this.title,
    this.appBarHeight,
    this.backgroundColor,
    this.shapeBorder,
    this.content,
    this.bottom,
    this.elevation,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevation ?? 0,
      automaticallyImplyLeading: false,
      leadingWidth: double.infinity,
      shape: shapeBorder,
      leading: Padding(
        padding: const EdgeInsets.all(AppSize.dimen16),
        child: Row(
          children: [
            // InkWell(
            //   onTap: () => Navigator.pop(context),
            //   // child: BPIcon.asset(assetName: leadingIcon ?? 'arrow_back'),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.dimen12),
              child: Text(
                title ?? '',
                style: GoogleFonts.rubik(
                  textStyle: textStyleW700S16,
                  color: AppColors.textPrimary,
                ),
              ),
            )
          ],
        ),
      ),
      flexibleSpace: content,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(AppSize.dimen0),
        child: bottom ??
            const SizedBox(
              height: AppSize.dimen0,
            ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight ?? AppSize.dimen54);
}