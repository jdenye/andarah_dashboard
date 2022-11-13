import 'package:flutter/material.dart';
import 'package:andarah/screens.dart';
import 'package:andarah/constants.dart';
import 'curved_chart.dart';
import 'pieChart.dart';

class Todo{
  String name;
  bool enable;
  Todo({required this.name, this.enable= true});
}
class LeftPanelPage extends StatefulWidget {
  /*const LeftPanelPage({Key? key}) : super(key: key);*/

  @override
  State<LeftPanelPage> createState() => _LeftPanelPageState();
}

class _LeftPanelPageState extends State<LeftPanelPage> {
  List <Todo> _todo = [
    Todo(name: 'Purchase Paper', enable: true),
    Todo(name: 'Inventory Of Guess', enable: true),
    Todo(name: 'Hire Staff', enable: true),
    Todo(name: 'Marketing Strategies', enable: true),
    Todo(name: 'Customer niche', enable: true),
    Todo(name: 'Finish of disclosure', enable: true),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if(ScreenLayout.isComputer(context))
            Container(
              color: Constants.darkBlue,
              width: 50,
              child: Container(
                decoration: const BoxDecoration(
                  color: Constants.blueLight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                  )
                ),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                      left: Constants.kpadding /2,
                      right: Constants.kpadding /2,
                      top: Constants.kpadding /2,
                    ),
                  child: Card(
                    color: Constants.darkBlue,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      width: double.infinity,
                      child: const ListTile(
                        title: Text(
                          'Products sold',
                        style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text('4.8% sold',
                        style: TextStyle(color: Colors.white),

                      ),
                        trailing: Chip(
                            label: Text('1,5260,265'),
                        elevation: 3,
                        backgroundColor: Colors.white,
                        ),
                    ),
                  ),
                ),
                ),
                LineChartSample2(),// Graph 1
                PieChartSample2(),//graph 2
                // graph
                  Padding(
                   padding: const EdgeInsets.only(
                  left: Constants.kpadding /2,
                  right: Constants.kpadding /2,
                  top: Constants.kpadding /2,
                ),
                   child: Card(
                     color: Constants.darkBlue,
                       elevation: 3,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(20),
                       ),
                     child: Column(
                       children: List.generate(_todo.length,
                               (index) =>
                                   CheckboxListTile(
                                       title: Text(_todo[index].name,
                                           style:TextStyle(color: Colors.white)
                                       ),
                                       value: _todo[index].enable,
                           onChanged: (newValue){setState(() {
                             _todo[index].enable = newValue ?? true;
                       });}))
                     ),
                  ),
                  ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}