import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vascomm_flutter_technical_assessment/common/themes/app_colors.dart';
import 'package:vascomm_flutter_technical_assessment/common/themes/app_size.dart';
import 'package:vascomm_flutter_technical_assessment/common/themes/app_styles.dart';

class CustomSnackbarWidget {
  static Future<void> showSnackbar({
    required String message,
    int duration = 2,
    required BuildContext context,
  }) async {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.9,
        left: AppSize.dimen16,
        right: AppSize.dimen16,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: AppSize.dimen12,
        horizontal: AppSize.dimen16,
      ),
      content: Center(
        child: Text(
          message,
          style: GoogleFonts.rubik(
            textStyle: textStyleW400S12,
            color: AppColors.neutralWhite,
          ),
        ),
      ),
      duration: Duration(seconds: duration),
      backgroundColor: AppColors.textPrimary,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
