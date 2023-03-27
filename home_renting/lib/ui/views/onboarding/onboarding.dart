import 'package:flutter/material.dart';
import 'package:home_renting/ui/views/onboarding/onboarding_view_model.dart';
import 'package:home_renting/ui/views/onboarding/widgets/circles.dart';
import 'package:home_renting/ui/views/onboarding/widgets/page_view.dart';
import 'package:home_renting/ui/widgets/custom_back_button.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/custom_button.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
        viewModelBuilder: () => OnboardingViewModel(),
        builder: (context, model, child) {
          final Size screenSize = MediaQuery.of(context).size;
          final controller =
              PageController(keepPage: false, initialPage: model.currentIndex);
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.05,
                  horizontal: screenSize.height * 0.025),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [    
                  Container(
                    margin: EdgeInsets.only(top: screenSize.height * 0.07),
                    height: screenSize.height * 0.55,
                    alignment: Alignment.center,
                    child: PageView(
                      onPageChanged: model.setCurrentIndex,
                      controller: controller,
                      children: const <Widget>[
                        PageViewImage(
                          image:
                              "assets/json/portfolio.json",
                          title: "Organize Your Portfolio",
                          subtitle:
                              "Organize your real estate in a unique and wonderful way, with various filters to meet your needs",
                        ),
                        PageViewImage(
                          image: "assets/json/sm.json",
                          title: "Manage your social media reach",
                          subtitle:
                              "Manage and share your properties directly to any social media platform of your choice",
                        ),
                        PageViewImage(
                          image: "assets/json/sale.json",
                          title: "Easy Sales",
                          subtitle:
                              "Share and sale properties to your clients direct from your app",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.2),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            model.currentIndex == 0
                                ? const ActiveCircle()
                                : const InActiveCircle(),
                            model.currentIndex == 1
                                ? const ActiveCircle()
                                : const InActiveCircle(),
                            model.currentIndex < 2
                                ? const InActiveCircle()
                                : const ActiveCircle(),
                            
                          ],
                        ),
                         SizedBox(height: screenSize.height * 0.01),
                   
                      CustomButton(
                          title: "Get Started",
                          onTap: () {
                            model.navigateToSignUp();
                          },
                          
                        ),
                        
                ],
              ),
            ),
          );
        });
  }
}


