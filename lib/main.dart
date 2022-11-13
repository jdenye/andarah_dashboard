import 'package:flutter/material.dart';
import 'display_controller.dart';
import 'constants.dart';

void main() {
  runApp(const Andarah());

}

class Andarah extends StatelessWidget {
  const Andarah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Andarah dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Constants.blueLight,
        canvasColor: Constants.darkBlue,
            ),
        home:andy()
    );
  }
}




