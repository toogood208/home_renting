import 'package:flutter/material.dart';
import 'package:home_renting/ui/shared/text_styles.dart';
import 'package:home_renting/ui/views/signup/signup_view_model.dart';
import 'package:home_renting/ui/widgets/auth_body_text_widget.dart';
import 'package:home_renting/ui/widgets/custom_appbar.dart';
import 'package:home_renting/ui/widgets/custom_button.dart';
import 'package:home_renting/ui/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return ViewModelBuilder<SignUpViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: const CustomAppBar(title: "Signup"),
          body: SingleChildScrollView(
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
                    onPressed: model.showPassword,
                    icon: Icon(
                      model.passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: confirmPasswordController,
                  title: "Confirm Password",
                  textInputType: TextInputType.visiblePassword,
                  obscureText: model.confirmPasswordVissble,
                  suffixIcon: IconButton(
                    onPressed: model.showConfirmPassword,
                    icon: Icon(
                      model.confirmPasswordVissble
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const SizedBox(height: 24),
                AuthBodyTextWidget(
                  firstText: "Already have an account",
                  secondText: "Login",
                  onTap: model.navigateToLoginView,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  busy: model.isBusy,
                  title: "Signup",
                  onTap: () {
                    model.signUp(
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
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}
