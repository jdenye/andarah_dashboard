import 'package:flutter/material.dart';
import 'package:andarah/constants.dart';
import 'package:andarah/screens.dart';

class DrawerScreen extends StatefulWidget {
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class ButtonInfo {
  String title;
  IconData icon;

  ButtonInfo({required this.icon, required this.title});
}

int _indexCounter = 0;

List<ButtonInfo> _buttonNames = [
  ButtonInfo(title: 'Home', icon: Icons.home),
  ButtonInfo(title: 'Setting', icon: Icons.settings),
  ButtonInfo(title: 'Notification', icon: Icons.notifications),
  ButtonInfo(title: 'Contacts', icon: Icons.contact_page_rounded),
  ButtonInfo(title: 'Mails', icon: Icons.email_rounded),
  ButtonInfo(title: 'Security', icon: Icons.verified_user),
  ButtonInfo(title: 'User', icon: Icons.supervised_user_circle),
];

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.kpadding),
          child: Column(
            children: [
              ListTile(
                title: const Center(
                  child: Text(
                    'MENU LIST',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                trailing: ScreenLayout.isComputer(context)
                    ? null
                    : Icon(Icons.close, color: Colors.white),
              ),
              ...List.generate(
                _buttonNames.length,
                (index) => Column(
                  children: [
                    Container(
                      decoration: index == _indexCounter
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              gradient: LinearGradient(
                                colors: [
                                  Constants.blueLight.withOpacity(0.9),
                                  Constants.greenLight.withOpacity(0.9)
                                ],
                              ))
                          : null,
                      child: ListTile(
                        title: Text(
                          _buttonNames[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(Constants.kpadding),
                          child: Icon(_buttonNames[index].icon,
                              color: Colors.white),
                        ),
                        onTap: () {
                          setState(() {
                            _indexCounter = index;
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
