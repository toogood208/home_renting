import 'package:flutter/material.dart';
import 'package:home_renting/ui/shared/text_styles.dart';
import 'package:home_renting/ui/views/login/login_view_model.dart';
import 'package:home_renting/ui/widgets/app_spinner.dart';
import 'package:home_renting/ui/widgets/auth_body_text_widget.dart';
import 'package:home_renting/ui/widgets/custom_appbar.dart';
import 'package:home_renting/ui/widgets/custom_button.dart';
import 'package:home_renting/ui/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: const CustomAppBar(title: "Login"),
          body: model.isBusy ? const AppSpinner():
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 47),
                CustomTextField(
                  controller: emailController,
                  title: "Enter Email",
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: passwordController,
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
                  onTap: () {
                    model.loin(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  },
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
