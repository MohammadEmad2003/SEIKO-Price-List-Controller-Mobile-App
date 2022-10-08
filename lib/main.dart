// @dart = 2.9
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Comm/button.dart';
import 'package:http/http.dart' as http;

import 'Comm/dropdown.dart';
import 'Screens/add.dart';
import 'Screens/remove.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          child: child,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  List list;
  MyHomePage({Key key, this.list}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final items = ['SEIKO', 'Star Vision'];
  List<String> lensType = [];
  String dropdownValue = 'SEIKO';
  String data = 'Rx Single Vision';
  String condition;

  getList() {
    lensType.clear();
    for (int i = 0; i < widget.list.length; i++) {
      if (!(lensType.contains(widget.list[i]['case']))) {
        lensType.add(widget.list[i]['case']);
      }
    }
    data = lensType.first;
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
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/pattern.jpg"), fit: BoxFit.fill)),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              dropdown(
                  title: "Brand :",
                  items: items,
                  dpValue: dropdownValue,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  }),
              SizedBox(height: 30),
              button(
                  text: "Edit on Existing Item",
                  onPressed: () {
                    getList();
                    condition = "Edit on Existing Item";
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => brand(
                                data: data,
                                condition: condition,
                                lensType: lensType,
                                list: widget.list)));
                  }),
              button(
                  text: "Add New Item",
                  onPressed: () {
                    condition = "Add New Item";
                    getList();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => design(
                                data: data,
                                condition: condition,
                                lensType: lensType,
                                list: widget.list)));
                  }),
              button(
                  text: "Remove Item",
                  onPressed: () {
                    condition = "Remove Item";
                    getList();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => brand(
                                data: data,
                                condition: condition,
                                lensType: lensType,
                                list: widget.list)));
                  })
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  List list = [];
  Future ReadData() async {
    var url = "https://mysqlflutterapp.000webhostapp.com/fun/readData.php";
    var res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      var red = jsonDecode(res.body);

      setState(() {
        list.addAll(red);
      });
    }
  }

  getData() async {
    await ReadData();
  }

  @override
  void initState() {
    super.initState();
    getData();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MyHomePage(list: list))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/logo.jpg",
                ),
              ],
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
/*
  Adduser() {
    return Container(
      height: 300,
      child: Column(children: [
        TextFormField(
          controller: name,
        ),
        ElevatedButton(
            onPressed: () {
              AddData();
            },
            child: Text("UPLOAD"))
      ]),
    );
  }



  Edituser() {
    return Container(
      height: 300,
      child: Column(children: [
        TextFormField(
          controller: name,
        ),
        ElevatedButton(
            onPressed: () {
              AddData();
            },
            child: Text("UPLOAD"))
      ]),
    );
  }

  Future EditData(id) async {
    var url = "http://192.168.1.8/seiko/fun/addData.php";
    var res = await http
        .post(Uri.parse(url), body: {'coat': name.text, 'design': "xyz"});
    if (res.statusCode == 200) {
      var red = jsonDecode(res.body);
    }
  }
*/