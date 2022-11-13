import 'package:flutter/material.dart';
import 'package:andarah/constants.dart';
import 'package:andarah/right_panel/graph.dart';
import 'bar_chart.dart';

class Product{
  String name;
  bool enable;
  Product({this.enable = true, required this.name});
}

class RightPanelPage extends StatefulWidget {
  const RightPanelPage({Key? key}) : super(key: key);

  @override
  State<RightPanelPage> createState() => _RightPanelPageState();
}

class _RightPanelPageState extends State<RightPanelPage> {
  
  List<Product> _product = [
    Product(name: 'Catchieture',enable: true),
    Product(name: 'Faceflow',enable: true),
    Product(name: 'Startcatchie',enable: true),
    Product(name: 'Facemode',enable: true),
    Product(name: 'Makeface',enable: true),
    Product(name: 'Upcatchie',enable: true),
    Product(name: 'Faircatchie',enable: true),
    Product(name: 'Faceship',enable: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  const EdgeInsets.only(
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
                      'Net Revenue',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text('36% of Xptd Revenue',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Chip(
                      label: Text(r"$50,6325"),
                      elevation: 3,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            LineChartSample1(),
            BarChartSample1(),
            //Chart
            Padding(
              padding: const EdgeInsets.only(
              left: Constants.kpadding / 2,
              right: Constants.kpadding /2,
              top: Constants.kpadding /2,
            ),
              child: Card(
                color: Constants.darkBlue,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  children: List.generate(_product.length , (index) =>
                      SwitchListTile.adaptive(
                        title: Text(_product[index].name,
                          style: TextStyle(color: Colors.white),
                        ),
                        value: _product[index].enable,
                        onChanged: (newValue){
                          setState(() {
                            _product[index].enable = newValue;
                          });
                        },
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
