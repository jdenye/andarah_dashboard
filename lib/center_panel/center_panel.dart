import 'package:flutter/material.dart';
import 'package:andarah/constants.dart';
import 'package:andarah/center_panel/line_Graph.dart';
import 'linear_graph.dart';

class Person{
  String name;
  Color color;
  Person({required this.name, required this.color});
}

class CenterPanelPage extends StatefulWidget {
  const CenterPanelPage({Key? key}) : super(key: key);

  @override
  State<CenterPanelPage> createState() => _CenterPanelPageState();
}

class _CenterPanelPageState extends State<CenterPanelPage> {

  List<Person> _person = [
    Person(name: 'Paul Murray', color: Constants.darkBlue,),
    Person(name: 'Frances Robbins', color: Constants.redDark,),
    Person(name: 'Clayton Baldwin', color: Constants.orangeDark,),
    Person(name: 'Gail Ramos', color: Constants.white,),
    Person(name: 'Latoya Harper', color: Constants.nicelight,),
    Person(name: 'Brendan Patterson', color: Constants.blueblack,),
    Person(name: 'Elena Clark', color: Constants.redLight,),
    Person(name: 'Dean Simmons', color: Constants.blueLight,),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kpadding / 2,
                right: Constants.kpadding / 2,
                top: Constants.kpadding / 2,
              ),
              child: Card(
                color: Color(0xff020227),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  width: double.infinity,
                  child: const ListTile(
                    title: Text(
                      'Products in Stock',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      'percentage In stock',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    trailing: Chip(
                      label: Text('50,000 of stock'),
                      elevation: 3,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            BarChartSample2(),
            BarChartSample5(),
      Padding(
        padding: const EdgeInsets.only(
          bottom: Constants.kpadding,
          left: Constants.kpadding / 2,
          right: Constants.kpadding / 2,
          top: Constants.kpadding / 2,
        ),
        child: Card(
          color: Constants.blueblack ,
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),
        ),
          child: Column(
            children:
            List.generate(_person.length, (index) =>
                        ListTile(
                          leading: CircleAvatar(
                            radius: 15,
                            child: Text(
                              _person[index].name.substring(0,1),
                              style: TextStyle(color: Colors.yellowAccent),
                            ),
                            backgroundColor: _person[index].color,
                          ),
                          title: Text(
                            _person[index].name,
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            onPressed: (){},
                              icon:Icon(Icons.message,
                          color: Colors.white,),
                        ),
                        ),
          ),
      ),
      ),
      ),
          ],
        ),
        //chart middle
      ),
    );
  }
}
