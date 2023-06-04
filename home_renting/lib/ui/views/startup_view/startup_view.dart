import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_renting/ui/shared/text_styles.dart';
import 'package:home_renting/ui/views/startup_view/startup_view_model.dart';
import 'package:home_renting/ui/widgets/app_spinner.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      onViewModelReady: (model) => model.handleStartUpLogic(),
      viewModelBuilder: () => StartUpViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: const Color(0XFFFF8c01),
        body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Rently",
              style: appTitletextStyle.copyWith(
                  color: const Color.fromARGB(255, 249, 248, 248), 
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp),
            ),
            SizedBox(
              height: 80.h,
            ),
            const AppSpinner(
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
