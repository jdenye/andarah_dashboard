import 'package:flutter/material.dart';
import 'package:andarah/screens.dart';
import 'package:andarah/constants.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

//additional list in appBar if isComputer == true
List<String> _buttonNames = ['Overview', 'Revenue', 'Sales', 'Control'];
int _currentSelectedItem = 0;

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      /*decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Constants.redDark.withOpacity(0.9),
            Constants.redLight.withOpacity(0.9),
            Constants.greenLight.withOpacity(0.9),
          ],
        ),
      ),*/
      child: Row(
        children: [
          if (ScreenLayout.isComputer(context))
            Container(
              margin: EdgeInsets.all(Constants.kpadding),
              height: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                      blurRadius: 5)
                ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Color(0xE2A9C799),
                radius: 30,
                child: Image.asset('images/damn.png'),
              ),
            )
          else
            IconButton(
              padding: const EdgeInsets.all(Constants.kpadding),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              iconSize: 30,
              icon: const Icon(Icons.menu),
            ),
          const SizedBox(
            width: Constants.kpadding,
          ),
          Spacer(),
          if (ScreenLayout.isComputer(context))
            //creating list off button only accessible in computer mode via appBar
            ...List.generate(
              _buttonNames.length,
              (index) => TextButton(
                  onPressed: () {
                    setState(() {
                      _currentSelectedItem = index;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(Constants.kpadding * 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _buttonNames[index],
                          style: TextStyle(
                            color: _currentSelectedItem == index
                                ? Colors.white
                                : Colors.white70,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(Constants.kpadding / 2),
                          width: 60,
                          height: 2,
                          decoration: BoxDecoration(
                            gradient: _currentSelectedItem == index
                                ? const LinearGradient(
                                    colors: [
                                      Constants.redLight,
                                      Constants.blueblack,
                                    ],
                                  )
                                : null,
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          else
            Padding(
              padding: const EdgeInsets.all(Constants.kpadding * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _buttonNames[_currentSelectedItem],
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    margin: const EdgeInsets.all(Constants.kpadding / 2),
                    width: 60,
                    height: 2,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Constants.redLight,
                          Constants.blueblack,
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          Spacer(),
          IconButton(
            color: Colors.white,
            iconSize: 30,
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          Stack(
            children: [
              IconButton(
                color: Colors.white,
                iconSize: 30,
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
              const Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 8,
                  child: Text(
                    '2',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          if (!ScreenLayout.isPhoneScreen(context))
            Container(
              margin: const EdgeInsets.all(Constants.kpadding),
              height: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                      blurRadius: 10)
                ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.orangeAccent,
                radius: 30,
                child: Image.asset('images/damn.png'),
              ),
            ),
        ],
      ),
    );
  }
}
