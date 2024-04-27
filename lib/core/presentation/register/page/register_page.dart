import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vascomm_flutter_technical_assessment/common/constants/app_routes.dart';
import 'package:vascomm_flutter_technical_assessment/common/router/navigation.dart';
import 'package:vascomm_flutter_technical_assessment/common/themes/app_colors.dart';
import 'package:vascomm_flutter_technical_assessment/common/themes/app_size.dart';
import 'package:vascomm_flutter_technical_assessment/common/themes/app_styles.dart';
import 'package:vascomm_flutter_technical_assessment/core/presentation/login/bloc/login_bloc.dart';
import 'package:vascomm_flutter_technical_assessment/core/presentation/shared/assets_widget.dart';
import 'package:vascomm_flutter_technical_assessment/core/presentation/shared/button_widget.dart';
import 'package:vascomm_flutter_technical_assessment/core/presentation/shared/input_text_widget.dart';
import 'package:vascomm_flutter_technical_assessment/core/presentation/shared/password_form_field_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController idCardController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    final loginBloc = context.select((LoginBloc bloc) => bloc);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top + AppSize.dimen50,
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: AppSize.dimen24,
          right: AppSize.dimen24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Hai, ",
                    style: GoogleFonts.rubik(
                      textStyle: textStyleW600S28,
                      color: AppColors.textTitle,
                    ),
                  ),
                  TextSpan(
                    text: "Selamat Datang",
                    style: GoogleFonts.rubik(
                      textStyle: textStyleW800S28,
                      color: AppColors.textTitle,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Silahkan login untuk melanjutkan",
              style: GoogleFonts.rubik(
                textStyle: textStyleW600S12,
                color: AppColors.textPrimary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: AppSize.dimen24,
              ),
              child: SvgAssets.asset(assetName: "onboarding"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CommonFormFieldWidget(
                    textEditingController: firstNameController,
                    label: "Nama Depan",
                    hintText: "Masukkan nama depan anda",
                    onChanged: (value) => {},
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CommonFormFieldWidget(
                    textEditingController: lastNameController,
                    label: "Nama Belakang",
                    hintText: "Masukkan nama belakang anda",
                    onChanged: (value) => {},
                  ),
                ),
              ],
            ),
            CommonFormFieldWidget(
              textEditingController: idCardController,
              label: "No. KTP",
              hintText: "Masukkan No. KTP anda",
              onChanged: (value) => {},
            ),
            CommonFormFieldWidget(
              textEditingController: emailController,
              label: "Email",
              hintText: "Masukkan email anda",
              onChanged: (value) => {},
            ),
            CommonFormFieldWidget(
              textEditingController: phoneNumberController,
              label: "No. Telpon",
              hintText: "Masukkan No. Telpon anda",
              onChanged: (value) => {},
            ),
            PasswordFormFieldWidget(
              controller: passwordController,
              label: "Password",
              placeholder: "Masukkan password anda",
              isPassword: true,
              textObscured: loginBloc.state.isPasswordObscured,
              onVisibilityPressed: () => loginBloc..add(LoginEvent.toggleObscuredPassword()),
              onChanged: (value) => {},
            ),
            PasswordFormFieldWidget(
              controller: passwordController,
              label: "Konfirmasi Password",
              placeholder: "Konfirmasi password anda",
              isPassword: true,
              textObscured: loginBloc.state.isPasswordObscured,
              onVisibilityPressed: () => loginBloc..add(LoginEvent.toggleObscuredPassword()),
              onChanged: (value) => {},
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: AppSize.dimen40,
                bottom: AppSize.dimen30,
              ),
              child: CommonButtonWidget(
                onTap: () => {},
                buttonColor: AppColors.textSubtitle,
                title: "Register",
                iconName: "icon_arrow_right",
              ),
            ),
            Align(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Sudah punya akun ? ",
                      style: GoogleFonts.rubik(
                        textStyle: textStyleW400S14,
                        color: AppColors.textTertiary,
                      ),
                    ),
                    TextSpan(
                      text: "Login Sekarang",
                      style: GoogleFonts.rubik(
                        textStyle: textStyleW400S14,
                        color: AppColors.textSubtitle,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          CustomNavigation.replaceAll(context, AppRoutes.LOGIN);
                        },
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.only(top: AppSize.dimen40, bottom: AppSize.dimen20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: AppSize.dimen8),
                        child: Icon(
                          Icons.copyright_outlined,
                          size: 14,
                          color: AppColors.textTertiary,
                        ),
                      ),
                      Text(
                        "SILK. all right reserved.",
                        style: GoogleFonts.rubik(
                          textStyle: textStyleW600S12,
                          color: AppColors.textTertiary,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
