import 'package:flutter/material.dart';
import 'package:home_renting/ui/shared/text_styles.dart';
import 'package:home_renting/ui/views/login/login_view_model.dart';
import 'package:home_renting/ui/widgets/auth_body_text_widget.dart';
import 'package:home_renting/ui/widgets/custom_appbar.dart';
import 'package:home_renting/ui/widgets/custom_button.dart';
import 'package:home_renting/ui/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: const CustomAppBar(title: "Login"),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 47),
                const CustomTextField(
                  title: "Enter Email",
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  title: "Enter Password",
                  textInputType: TextInputType.visiblePassword,
                  obscureText: model.passwordVisible,
                  suffixIcon: IconButton(
                    onPressed: () => model.showPassword(),
                    icon: Icon(
                      model.passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Forgot Password?",
                      style: authBodyTextTextStyle,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                AuthBodyTextWidget(
                  firstText: "do not have an account?",
                  secondText: "Sign up",
                  onTap: model.navigateToSignUpView,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  title: "Login",
                  onTap: () {},
                )
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}