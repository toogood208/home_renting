import 'package:flutter/material.dart';
import 'package:home_renting/ui/views/settings/settings_view_model.dart';
import 'package:home_renting/ui/widgets/custom_appbar.dart';
import 'package:home_renting/ui/widgets/custom_divider.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      builder: (context, model, child) => const Scaffold(
        appBar: CustomAppBar(title: "Settings"),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  Text(
                    'APP SETTINGS',
                  ),
                  SizedBox(height: 8.0),
                  CustomDivider(),
                  SizedBox(height: 8.0),
                  Text(
                    'SECURITY',
                  ),
                  CustomDivider(),
                  SizedBox(height: 8.0),
                  Text(
                    'SUPPORT',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SettingsViewModel(),
    );
  }
}
