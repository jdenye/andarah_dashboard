import 'package:flutter/material.dart';

class ScreenLayout extends StatelessWidget {
  const ScreenLayout({super.key,
    required this.miniScreen,
    required this.computer,
    required this.largeTablet,
     required this.phoneScreen,
    required this.tablets,
});

  final Widget miniScreen;
  final Widget phoneScreen;
  final Widget tablets;
  final Widget largeTablet;
  final Widget computer;

  //setting screen limited for devices
  static const int miniHeightLimit = 100;
  static const int miniScreenLimit = 270;
  static const int phoneScreenLimit = 550;
  static const int tabletLimit = 880;
  static const int largeTableLimit = 1100;

  // setting each screen height to limit of media size
  static bool isMiniHeight(BuildContext context) => MediaQuery.of(context).size.height < miniHeightLimit;

  static bool isMiniScreenLimit(BuildContext context) => MediaQuery.of(context).size.width < miniScreenLimit;

  static bool isPhoneScreen(BuildContext context) => (MediaQuery.of(context).size.width < phoneScreenLimit
      && MediaQuery.of(context).size.width >= miniScreenLimit) ;

  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width < tabletLimit
      && MediaQuery.of(context).size.width >= phoneScreenLimit;

  static bool isLargerTablet(BuildContext context) => MediaQuery.of(context).size.width < largeTableLimit
      && MediaQuery.of(context).size.width >= tabletLimit;

  static bool isComputer(BuildContext context) => MediaQuery.of(context).size.width >= largeTableLimit;

  @override
  Widget build(BuildContext context) {
    //building screen layout according to size
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          if(constraints.maxWidth < miniScreenLimit || constraints.maxHeight < miniHeightLimit)
          {
            return miniScreen;
          }
          if(constraints.maxWidth < phoneScreenLimit){
            return phoneScreen;
          }
          if(constraints.maxWidth < tabletLimit){
            return tablets;
          }
          if(constraints.maxWidth < largeTableLimit){
            return largeTablet;
          }
          else {
            return computer;
          }
        }
        );
  }
}
