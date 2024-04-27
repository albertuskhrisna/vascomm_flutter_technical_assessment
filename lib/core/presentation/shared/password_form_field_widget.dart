import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vascomm_flutter_technical_assessment/common/themes/app_colors.dart';
import 'package:vascomm_flutter_technical_assessment/common/themes/app_size.dart';
import 'package:vascomm_flutter_technical_assessment/common/themes/app_styles.dart';

class PasswordFormFieldWidget extends StatelessWidget {
  final bool? isError, isDense, readonly, interactive;
  final String? errorText;
  final TextEditingController? _controller;
  final FormFieldValidator<String>? validator;
  final String? placeholder, label, desc;
  final bool? isPassword;
  final double? elevation;
  final Widget? suffixIcon;
  final bool? textObscured;
  final Function()? onVisibilityPressed;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry outerPadding, innerPadding;

  const PasswordFormFieldWidget({
    super.key,
    @required TextEditingController? controller,
    this.onVisibilityPressed,
    this.onChanged,
    this.keyboardType,
    this.desc,
    this.label,
    this.innerPadding = const EdgeInsets.symmetric(vertical: 15),
    this.textObscured = true,
    this.isError = false,
    this.readonly = false,
    this.interactive = true,
    this.errorText,
    this.validator,
    this.isDense = false,
    this.elevation = 4.0,
    this.outerPadding = const EdgeInsets.fromLTRB(32.0, 0.5, 32.0, 0),
    this.suffixIcon = const Icon(
      Icons.error_outline,
      size: 30,
      color: Color.fromRGBO(255, 0, 0, 1.0),
    ),
    this.placeholder,
    this.isPassword = false,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (label != null) ...[
          Text(
            label ?? '',
            style: GoogleFonts.rubik(
              textStyle: textStyleW600S16,
              color: AppColors.textSubtitle,
            ),
          ),
          const SizedBox(height: AppSize.dimen6),
        ],
        if (desc != null) ...[
          Text(
            desc ?? '',
            style: GoogleFonts.rubik(
              textStyle: textStyleW400S15,
              color: AppColors.textTertiary,
            ),
          ),
          const SizedBox(height: AppSize.dimen6),
        ],
        Material(
          color: Colors.transparent,
          shadowColor: AppColors.shadow,
          elevation: 24,
          child: TextFormField(
            readOnly: readonly ?? false,
            controller: _controller,
            keyboardType: keyboardType,
            obscureText: _showPassword(),
            onChanged: (value) {
              onChanged?.call(value);
            },
            enableInteractiveSelection: interactive ?? false,
            validator: validator,
            style: GoogleFonts.rubik(textStyle: textStyleW400S15, color: AppColors.textPrimary),
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: GoogleFonts.rubik(color: AppColors.textQuartenary),
              contentPadding: const EdgeInsets.all(AppSize.dimen14),
              suffix: isError ?? false
                  ? const Icon(
                      Icons.error_outline,
                      size: 25,
                      color: Color.fromRGBO(255, 0, 0, 1.0),
                    )
                  : null,
              suffixIcon: _suffixIcon(),
              fillColor: AppColors.neutralWhite,
              filled: true,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSize.dimen12),
                ),
                borderSide: BorderSide.none,
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSize.dimen12),
                ),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 3, 0, 8),
          child: isError ?? false
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      isError ?? false ? errorText ?? "" : '',
                      style: TextStyle(color: AppColors.feedbackError, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              : SizedBox(height: MediaQuery.of(context).size.height * 0.000005),
        ),
      ],
    );
  }

  Widget? _suffixIcon() {
    if (isPassword ?? false) {
      return Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: IconButton(
          onPressed: isPassword ?? false ? onVisibilityPressed : null,
          icon: textObscured ?? false
              ? Icon(
                  Icons.visibility_off,
                  color: AppColors.textQuartenary,
                )
              : Icon(
                  Icons.visibility,
                  color: AppColors.textQuartenary,
                ),
        ),
      );
    }
    return isError ?? false ? suffixIcon : null;
  }

  bool _showPassword() {
    if (isPassword ?? false) {
      return textObscured ?? false;
    }
    return false;
  }
}
