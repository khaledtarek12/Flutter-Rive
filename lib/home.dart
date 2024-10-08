import 'package:flutter/material.dart';
import 'package:rive_ui/samples/Rive_ui/theme.dart';
import 'package:rive_ui/samples/navigation/custom_tab_bar.dart';
import 'package:rive_ui/samples/navigation/home_tab_view.dart';

class RiveAppHome extends StatefulWidget {
  const RiveAppHome({super.key});

  @override
  State<RiveAppHome> createState() => _RiveAppHomeState();
}

Widget tabBody = Container(color: RiveAppTheme.background);
final List<Widget> screens = [
  const HomeTabView(),
  commonTabScene("Search"),
  commonTabScene("Timer"),
  commonTabScene("Bell"),
  commonTabScene("User"),
];

@override
class _RiveAppHomeState extends State<RiveAppHome> {
  @override
  void initState() {
    tabBody = screens.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: tabBody,
      bottomNavigationBar: CustomTabBar(
        onTabChanged: (tabIndex) {
          setState(() {
            tabBody = screens[tabIndex];
          });
        },
      ),
    );
  }
}

Widget commonTabScene(String tabName) {
  return Container(
      color: RiveAppTheme.background,
      alignment: Alignment.center,
      child: Text(tabName,
          style: const TextStyle(
              fontSize: 28, fontFamily: "Poppins", color: Colors.black)));
}
