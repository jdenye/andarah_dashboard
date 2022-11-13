import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'screens.dart';
import 'Drawers/drawer_screen.dart';
import 'center_panel/center_panel.dart';
import 'right_panel/right_panel.dart';
import 'left_panel/left_panel_page.dart';
import 'package:andarah/custom_app_bar/app_bar_widget.dart';
import 'constants.dart';


class andy extends StatefulWidget {
  const andy({Key? key}) : super(key: key);

  @override
  State<andy> createState() => _andyState();
}

class _andyState extends State<andy> {
 int currentIndex = 1;

 List <Widget> icons = [
   Icon(Icons.add, size: 30),
   Icon(Icons.list, size: 30),
   Icon(Icons.compare_arrows, size: 30),
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // calling screen layout to determine the device size and which screen contain to display
      appBar: PreferredSize(
        child: (ScreenLayout.isMiniScreenLimit(context) ||
            ScreenLayout.isMiniHeight(context)? Container() : AppBarWidget()),
        preferredSize: Size(double.infinity, 100)
      ),
          // loading the body according to screen size
          body: ScreenLayout(
            //display nothing when  screen is under minimum
        miniScreen: Container(),
        //display a single row when device is a phone
        phoneScreen: currentIndex ==0 ? LeftPanelPage(): currentIndex == 1 ?CenterPanelPage():RightPanelPage(),
        //display 2 rows when device is a tablet
        tablets: Row( children: [
          Expanded(child: LeftPanelPage()),
          Expanded(child: CenterPanelPage())
        ],),
        //display 3 row when device is a bigger tablet
        largeTablet: Row( children: [
          Expanded(child: LeftPanelPage()),
          Expanded(child: CenterPanelPage()),
          Expanded(child: RightPanelPage()),
        ],),
    //display all component when device is computer or higher
    computer: Row( children: [
      Expanded(child: DrawerScreen()),
      Expanded(child: LeftPanelPage()),
      Expanded(child: CenterPanelPage()),
      Expanded(child: RightPanelPage()),
    ],),
    ),
      drawer: DrawerScreen(),
      bottomNavigationBar:
      ScreenLayout.isPhoneScreen(context)
          ? CurvedNavigationBar(
        index: currentIndex,
          backgroundColor: Constants.nicelight,
          onTap: (index){
          setState(() {
            currentIndex = index;
          });
          },
          items: icons): SizedBox(),
    );

  }
}
