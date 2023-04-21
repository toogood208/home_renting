import 'package:flutter/material.dart';
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
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset('assets/images/fucci_logo.png'),
              const AppSpinner()
            ],
          ),
        ),
      ),
    );
  }
}
