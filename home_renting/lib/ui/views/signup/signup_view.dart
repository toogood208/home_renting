import 'package:flutter/material.dart';
import 'package:home_renting/ui/shared/colors.dart';
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
    TextEditingController fullnameController = TextEditingController();
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
                  controller: fullnameController,
                  title: "Enter Fullname",
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 24),
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
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.only(left: 12),
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: neutralColor.shade200),
                        borderRadius: BorderRadius.circular(6)),
                    child: DropdownButton(
                      value:model.selectRole,
                      items: ["agent", "user"]
                          .map(
                            (String item) => DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            ),
                          )
                          .toList(),
                      onChanged: ((value) {
                        model.selectedRole(value!);
                      }),
                    ),
                  ),
                ),
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
