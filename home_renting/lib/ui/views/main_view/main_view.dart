import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_renting/admin/create_rent/add_propert.dart';
import 'package:home_renting/ui/shared/colors.dart';
import 'package:home_renting/ui/views/home/home_view.dart';
import 'package:home_renting/ui/views/main_view/widgets/custom_fab.dart';
import 'package:home_renting/ui/views/profile/profile.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MainView> with TickerProviderStateMixin {
  final pages = const <Widget>[Home(), ProfileView()];

  Widget _lastSelected = const Home();

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _lastSelected,
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: "",
        color: Colors.grey,
        selectedColor: kPrimary2,
        notchedShape: null,
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: CupertinoIcons.home, text: 'Home'),
          FABBottomAppBarItem(
              iconData: CupertinoIcons.profile_circled, text: 'Profile'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPrimary2,
        elevation: 4.0,
        icon: const Icon(Icons.add),
        label: const Text('Add Property'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddPropertView(),
            ),
          );
        },
      ),
    );
  }
}
