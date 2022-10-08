// @dart = 2.9
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:pricelistcontroller/Comm/Toast.dart';
import '../Comm/button.dart';
import '../Comm/dropdown.dart';

class cyl extends StatefulWidget {
  String data;
  String dvtrp;
  String trpower;
  String dvcyl;
  String cyli;
  String desi;
  String inde;
  String coat;
  String treat;
  String price;
  String id;
  List list;
  String condition;
  cyl(
      {Key key,
      this.data,
      this.coat,
      this.desi,
      this.inde,
      this.treat,
      this.list,
      this.trpower,
      this.cyli,
      this.price,
      this.condition,
      this.id})
      : super(key: key);

  @override
  State<cyl> createState() => _cylState(
      data, coat, desi, inde, trpower, treat, cyli, price, condition, id);
}

class _cylState extends State<cyl> {
  String data;
  String cyli;
  String desi;
  String inde;
  String coat;
  String treat;
  String trpower;
  String lensType;
  String condition;
  String id;
  String price = "0";
  String design;
  List<String> cylinder = [];

  _cylState(this.data, this.coat, this.desi, this.inde, this.trpower,
      this.treat, this.cyli, this.price, this.condition, this.id);
  @override
  void initState() {
    super.initState();
    if (desi == 'DOUBLE ASPHERIC  AZ & A-Zone')
      design = 'AZ & A-Zone';
    else
      design = desi;
    setState(() {});
  }

  Future AddData() async {
    var url = "https://mysqlflutterapp.000webhostapp.com/fun/addData.php";
    var res = await http.post(Uri.parse(url), body: {
      'case': data,
      'cyl': cyli,
      'design': desi,
      'coat': coat,
      'index': inde,
      'treat': treat,
      'trp': trpower,
      'price': price
    });
    if (res.statusCode == 200) {
      var red = jsonDecode(res.body);
      alertDialog(context, "Your Data has been added Successfully");
      Navigator.pop(context);
    }
  }

  Future DeleteData(id) async {
    var url = "https://mysqlflutterapp.000webhostapp.com/fun/deleteData.php";
    var res = await http.post(Uri.parse(url), body: {
      'id': id,
    });
    if (res.statusCode == 200) {
      var red = jsonDecode(res.body);
      alertDialog(context, "Your Data has been deleted Successfully");
      Navigator.pop(context);
    }
  }

  void Data() {
    if (condition == "Add New Item") {
      AddData();
    } else if (condition == "Remove Item") {
      print(id);
      DeleteData(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Navigation bar
          statusBarColor: Colors.black, // Status bar
        ),
        backgroundColor: Colors.black,
        title: Text(
          "Welcome to SEIKO Price List",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("Lens Description :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 35)),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 30),
                          Column(
                            children: <Widget>[
                              Text(
                                "Lens Type : \nDesign : \nIndex : \nCoating : \nTreatment : \nTR Power : \nCylinder :",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "${data} \n${design} \n${inde} \n${coat} \n${treat} \n${trpower} \n${cyli}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(210, 140, 0, 100)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  Text("Price :",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 35)),
                  SizedBox(width: 10),
                  Text(
                    price,
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(210, 140, 0, 100)),
                  ),
                ],
              ),
              button(
                text: condition,
                onPressed: () {
                  Data();
                },
              )
            ],
          ),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/pattern.jpg"), fit: BoxFit.fill)),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
