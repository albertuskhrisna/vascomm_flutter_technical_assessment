import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vascomm_flutter_technical_assessment/common/themes/app_colors.dart';
import 'package:vascomm_flutter_technical_assessment/common/themes/app_size.dart';
import 'package:vascomm_flutter_technical_assessment/common/themes/app_styles.dart';

class CommonFormFieldWidget extends StatelessWidget {
  final String? label, desc;
  final String? hintText;
  final TextEditingController textEditingController;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon, suffixIcon;
  final TextInputType? keyboardType;
  final Color? focusedBorderColor, enabledBorderColor, fillColor;
  final BoxConstraints? prefixIconConstraints, suffixIconConstraints;
  final BorderRadius? borderRadius;
  final bool? isReadOnly;
  final bool? isMandatory;
  final int? maxLength;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final String? suffixText;
  final Function(String)? onFieldSubmitted;

  const CommonFormFieldWidget({
    super.key,
    required this.textEditingController,
    required this.onChanged,
    this.textAlign = TextAlign.left,
    this.hintText,
    this.label,
    this.desc,
    this.prefixIconConstraints,
    this.prefixIcon,
    this.keyboardType,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.borderRadius,
    this.isReadOnly,
    this.isMandatory,
    this.maxLength,
    this.fillColor,
    this.focusNode,
    this.suffixText,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            textInputAction: TextInputAction.done,
            readOnly: isReadOnly ?? false,
            textAlign: textAlign,
            maxLength: maxLength,
            focusNode: focusNode,
            onFieldSubmitted: onFieldSubmitted,
            buildCounter: (
              context, {
              required currentLength,
              required isFocused,
              maxLength,
            }) {
              return maxLength != null
                  ? Text(
                      "${textEditingController.text.length}/$maxLength",
                      style: GoogleFonts.rubik(
                        textStyle: textStyleW400S11,
                        color: AppColors.textPrimary,
                      ),
                    )
                  : const SizedBox();
            },
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            onChanged: (value) {
              onChanged?.call(value);
            },
            controller: textEditingController,
            style: GoogleFonts.rubik(
              textStyle: textStyleW400S15,
              color: AppColors.textPrimary,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: fillColor ?? AppColors.neutralWhite,
              suffixText: suffixText,
              suffixStyle: GoogleFonts.rubik(
                textStyle: textStyleW400S15,
                color: AppColors.textPrimary,
              ),
              prefixIconConstraints: prefixIconConstraints,
              suffixIconConstraints: suffixIconConstraints,
              contentPadding: const EdgeInsets.all(AppSize.dimen14),
              focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius ??
                    const BorderRadius.all(
                      Radius.circular(AppSize.dimen12),
                    ),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ??
                    const BorderRadius.all(
                      Radius.circular(AppSize.dimen12),
                    ),
                borderSide: BorderSide.none,
              ),
              hintStyle: GoogleFonts.rubik(color: AppColors.textQuartenary),
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
            keyboardType: keyboardType ?? TextInputType.text,
          ),
        ),
      ],
    );
  }
}

class CommonFormFieldWithLongTextWidget extends StatelessWidget {
  final String label, hintText, desc;
  final TextEditingController textEditingController;
  final ValueChanged<String> onChanged;
  final int maxLines;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;

  const CommonFormFieldWithLongTextWidget(
      {super.key,
      this.desc = "",
      required this.hintText,
      required this.label,
      required this.maxLines,
      required this.onChanged,
      required this.textEditingController,
      this.textInputAction = TextInputAction.none,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.rubik(
            textStyle: textStyleW500S15,
            color: AppColors.textPrimary,
          ),
        ),
        if (desc != "")
          Text(
            desc,
            style: GoogleFonts.rubik(
              textStyle: textStyleW400S15,
              color: AppColors.textTertiary,
            ),
          ),
        const SizedBox(height: AppSize.dimen8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundSurfaceOne,
            border: Border.all(
              color: AppColors.disableButton,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppSize.dimen12),
            ),
          ),
          child: TextFormField(
            textInputAction: textInputAction,
            focusNode: focusNode,
            onChanged: onChanged,
            controller: textEditingController,
            style: GoogleFonts.rubik(
              textStyle: textStyleW400S15,
              color: AppColors.textPrimary,
            ),
            decoration: InputDecoration(
              filled: true,
              contentPadding: const EdgeInsets.all(AppSize.dimen16),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(AppSize.dimen12),
                ),
                borderSide: BorderSide(
                  color: AppColors.line,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(AppSize.dimen12),
                ),
                borderSide: BorderSide(
                  color: AppColors.line,
                ),
              ),
              hintStyle: GoogleFonts.rubik(color: AppColors.textQuartenary),
              hintText: hintText,
            ),
            keyboardType: TextInputType.multiline,
            maxLines: maxLines,
          ),
        ),
      ],
    );
  }
}

class CommonFormFieldWithActionWidget extends StatelessWidget {
  final String label, hintText, desc;
  final void Function() onTap;
  final Widget icon;

  const CommonFormFieldWithActionWidget({
    super.key,
    required this.label,
    required this.onTap,
    required this.icon,
    required this.hintText,
    this.desc = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.rubik(
            textStyle: textStyleW500S15,
            color: AppColors.textPrimary,
          ),
        ),
        if (desc != "")
          Text(
            desc,
            style: GoogleFonts.rubik(
              textStyle: textStyleW400S15,
              color: AppColors.textTertiary,
            ),
          ),
        const SizedBox(height: AppSize.dimen8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              color: AppColors.backgroundSurfaceOne,
              border: Border.all(color: AppColors.disableButton, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(AppSize.dimen12)),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: AppSize.dimen16),
                  child: Text(
                    hintText,
                    style: GoogleFonts.rubik(
                      textStyle: textStyleW400S15,
                      color: AppColors.textPrimary,
                    ),
                  ),
                )),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppSize.dimen14, horizontal: AppSize.dimen17),
                      child: icon,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
