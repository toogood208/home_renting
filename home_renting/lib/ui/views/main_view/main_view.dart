import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_renting/admin/property_list/property_list_view.dart';
import 'package:home_renting/ui/views/home/home_view.dart';
import 'package:home_renting/ui/views/main_view/widgets/custom_fab.dart';


class MainView extends StatefulWidget {
  const MainView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MainView> with TickerProviderStateMixin {
  final pages = const <Widget>[
    Home(),
    PropertyListView(),
  ];

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
        selectedColor: Colors.blue,
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
        elevation: 4.0,
        icon: const Icon(Icons.add),
        label: const Text('Add Property'),
        onPressed: () {},
      ),

    );
  }
}
