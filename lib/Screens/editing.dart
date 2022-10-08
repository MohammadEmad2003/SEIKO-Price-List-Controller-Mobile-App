// @dart = 2.9
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Comm/Toast.dart';
import '../Comm/button.dart';
import '../Comm/dropdown.dart';
import '../Comm/textField.dart';

class editin extends StatefulWidget {
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
  List<String> lensType;
  String condition;
  editin(
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
      this.id,
      this.lensType})
      : super(key: key);

  @override
  State<editin> createState() => _editinState(
      data, coat, desi, inde, trpower, treat, cyli, price, condition, id);
}

class _editinState extends State<editin> {
  String data;
  String desi;
  String inde;
  String coat;
  String treat;
  String dvlt;
  String dvtrp;
  String trpo;
  String dvcyl;
  String cyli;
  String price;
  String dvtreat;
  String condition;
  final TextEditingController desig = TextEditingController();
  final TextEditingController ind = TextEditingController();
  final TextEditingController lensTyp = TextEditingController();
  final TextEditingController coatin = TextEditingController();
  final TextEditingController treatmen = TextEditingController();
  final TextEditingController trpowe = TextEditingController();
  final TextEditingController cylinde = TextEditingController();
  final TextEditingController pric = TextEditingController();
  String dvdesign;
  String dvind;
  String dvcoat;
  String dvprice;
  String design;
  String id;
  String trpower;
  List<String> index = ["      "];
  List<String> coating = ["      "];
  List<String> treatment = ["      "];
  List<String> des = ["      "];
  List<String> cylinder = ["      "];
  List<String> trpow = ["      "];
  _editinState(this.data, this.coat, this.desi, this.inde, this.trpower,
      this.treat, this.cyli, this.price, this.condition, this.id);

  @override
  void initState() {
    super.initState();
    dvlt = data;
    if (desi == 'DOUBLE ASPHERIC  AZ & A-Zone')
      design = 'AZ & A-Zone';
    else
      design = desi;
    setState(() {
      getDesign();
      getIndex();
      getCoat();
      getTreat();
      getTrp();
      getCyl();
      getPrice();
      lensTyp.text = data;
      desig.text = desi;
      ind.text = inde;
      coatin.text = coat;
      treatmen.text = treat;
      trpowe.text = trpo;
      cylinde.text = cyli;
      pric.text = price;
    });
    print(id);
  }

  Future EditData(id) async {
    print(id);
    var url = "https://mysqlflutterapp.000webhostapp.com/fun/editData.php";
    var res = await http.post(Uri.parse(url), body: {
      'id': id,
      'case': data,
      'cyl': cyli,
      'design': desi,
      'coat': coat,
      'index': inde,
      'treat': treat,
      'trp': trpower,
      'price': price,
    });
    if (res.statusCode == 200) {
      var red = jsonDecode(res.body);
      alertDialog(context, "Your Data has been edited Successfully");
      Navigator.pop(context);
    }
  }

  getDesign() {
    des.clear();
    for (int i = 0; i < widget.list.length; i++) {
      if (data == widget.list[i]['case']) {
        if (!(des.contains(widget.list[i]['design']))) {
          des.add(widget.list[i]['design']);
        }
      }
    }
    dvdesign = des.first;
    desi = des.first;
    if (desi == 'DOUBLE ASPHERIC  AZ & A-Zone')
      design = 'AZ & A-Zone';
    else
      design = desi;
  }

  getIndex() {
    index.clear();
    for (int i = 0; i < widget.list.length; i++) {
      if ((data == widget.list[i]['case']) &&
          (desi == widget.list[i]['design'])) {
        if (!(index.contains(widget.list[i]['index']))) {
          index.add(widget.list[i]['index']);
        }
      }
    }
    dvind = index.first;
    inde = index.first;
  }

  getCoat() {
    coating.clear();
    for (int i = 0; i < widget.list.length; i++) {
      if ((data == widget.list[i]['case']) &&
          (desi == widget.list[i]['design']) &&
          (inde == widget.list[i]['index'])) {
        if (!(coating.contains(widget.list[i]['coat']))) {
          coating.add(widget.list[i]['coat']);
        }
      }
    }
    dvcoat = coating.first;
    coat = coating.first;
  }

  getTreat() {
    treatment.clear();
    for (int i = 0; i < widget.list.length; i++) {
      if ((data == widget.list[i]['case']) &&
          (desi == widget.list[i]['design']) &&
          (inde == widget.list[i]['index']) &&
          (coat == widget.list[i]['coat'])) {
        if (!(treatment.contains(widget.list[i]['treat']))) {
          treatment.add(widget.list[i]['treat']);
        }
      }
    }
    dvtreat = treatment.first;
    treat = treatment.first;
  }

  getTrp() {
    trpow.clear();
    for (int i = 0; i < widget.list.length; i++) {
      if ((data == widget.list[i]['case']) &&
          (desi == widget.list[i]['design']) &&
          (inde == widget.list[i]['index']) &&
          (coat == widget.list[i]['coat']) &&
          (treat == widget.list[i]['treat'])) {
        if (!(trpow.contains(widget.list[i]['trp']))) {
          trpow.add(widget.list[i]['trp']);
        }
      }
    }
    dvtrp = trpow.first;
    trpo = trpow.first;
  }

  getCyl() {
    cylinder.clear();
    for (int i = 0; i < widget.list.length; i++) {
      if ((data == widget.list[i]['case']) &&
          (desi == widget.list[i]['design']) &&
          (inde == widget.list[i]['index']) &&
          (coat == widget.list[i]['coat']) &&
          (trpo == widget.list[i]['trp']) &&
          (treat == widget.list[i]['treat'])) {
        if (!(cylinder.contains(widget.list[i]['cyl']))) {
          cylinder.add(widget.list[i]['cyl']);
        }
      }
    }
    dvcyl = cylinder.first;
    cyli = cylinder.first;
  }

  getPrice() {
    for (int i = 0; i < widget.list.length; i++) {
      if ((data == widget.list[i]['case']) &&
          (desi == widget.list[i]['design']) &&
          (inde == widget.list[i]['index']) &&
          (coat == widget.list[i]['coat']) &&
          (trpo == widget.list[i]['trp']) &&
          (cyli == widget.list[i]['cyl']) &&
          (treat == widget.list[i]['treat'])) {
        id = widget.list[i]['id'];
        price = widget.list[i]['price'];
      }
    }
    dvprice = price;
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
      body: SingleChildScrollView(
        child: Center(
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
                dropdown(
                    title: "Lens Type :",
                    items: widget.lensType,
                    dpValue: dvlt,
                    onChanged: (String newValue) {
                      setState(() {
                        dvlt = newValue;
                        data = newValue;
                        getDesign();
                        lensTyp.text = data;
                        desig.text = desi;
                        ind.text = inde;
                        coatin.text = coat;
                        treatmen.text = treat;
                        trpowe.text = trpo;
                        cylinde.text = cyli;
                        pric.text = price;
                      });
                    }),
                SizedBox(height: 20),
                costumTF(controller: lensTyp),
                dropdown(
                    title: "Design :",
                    items: des,
                    dpValue: dvdesign,
                    onChanged: (String newValue) {
                      setState(() {
                        dvdesign = newValue;
                        desi = newValue;
                        getIndex();
                        lensTyp.text = data;
                        desig.text = desi;
                        ind.text = inde;
                        coatin.text = coat;
                        treatmen.text = treat;
                        trpowe.text = trpo;
                        cylinde.text = cyli;
                        pric.text = price;
                      });
                    }),
                SizedBox(height: 10),
                costumTF(controller: desig),
                dropdown(
                    title: "Index :",
                    items: index,
                    dpValue: dvind,
                    onChanged: (String newValue) {
                      setState(() {
                        dvind = newValue;
                        inde = newValue;
                        getCoat();
                        lensTyp.text = data;
                        desig.text = desi;
                        ind.text = inde;
                        coatin.text = coat;
                        treatmen.text = treat;
                        trpowe.text = trpo;
                        cylinde.text = cyli;
                        pric.text = price;
                      });
                    }),
                SizedBox(height: 10),
                costumTF(controller: ind),
                dropdown(
                    title: "Coating :",
                    items: coating,
                    dpValue: dvcoat,
                    onChanged: (String newValue) {
                      setState(() {
                        dvcoat = newValue;
                        coat = newValue;
                        getTreat();
                        lensTyp.text = data;
                        desig.text = desi;
                        ind.text = inde;
                        coatin.text = coat;
                        treatmen.text = treat;
                        trpowe.text = trpo;
                        cylinde.text = cyli;
                        pric.text = price;
                      });
                    }),
                SizedBox(height: 10),
                costumTF(controller: coatin),
                dropdown(
                    title: "Treatment :",
                    items: treatment,
                    dpValue: dvtreat,
                    onChanged: (String newValue) {
                      setState(() {
                        dvtreat = newValue;
                        treat = newValue;
                        getTrp();
                        lensTyp.text = data;
                        desig.text = desi;
                        ind.text = inde;
                        coatin.text = coat;
                        treatmen.text = treat;
                        trpowe.text = trpo;
                        cylinde.text = cyli;
                        pric.text = price;
                      });
                    }),
                SizedBox(height: 20),
                costumTF(controller: treatmen),
                dropdown(
                    title: "Total Range Power :",
                    items: trpow,
                    dpValue: dvtrp,
                    onChanged: (String newValue) {
                      setState(() {
                        dvtrp = newValue;
                        trpo = newValue;
                        getCyl();
                        lensTyp.text = data;
                        desig.text = desi;
                        ind.text = inde;
                        coatin.text = coat;
                        treatmen.text = treat;
                        trpowe.text = trpo;
                        cylinde.text = cyli;
                        pric.text = price;
                      });
                    }),
                SizedBox(height: 20),
                costumTF(controller: trpowe),
                dropdown(
                    title: "Cylinder :",
                    items: cylinder,
                    dpValue: dvcyl,
                    onChanged: (String newValue) {
                      setState(() {
                        dvcyl = newValue;
                        cyli = newValue;
                        lensTyp.text = data;
                        desig.text = desi;
                        ind.text = inde;
                        coatin.text = coat;
                        treatmen.text = treat;
                        trpowe.text = trpo;
                        cylinde.text = cyli;
                        pric.text = price;
                      });
                    }),
                SizedBox(height: 20),
                costumTF(controller: cylinde),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    SizedBox(width: 20),
                    Text("Price :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 35)),
                  ],
                ),
                SizedBox(height: 20),
                costumTF(controller: pric),
                SizedBox(height: 30),
                button(
                  text: condition,
                  onPressed: () {
                    data = lensTyp.text;
                    desi = desig.text;
                    inde = ind.text;
                    coat = coatin.text;
                    treat = treatmen.text;
                    trpo = trpowe.text;
                    cyli = cylinde.text;
                    price = pric.text;
                    print(id);
                    EditData(id);
                  },
                ),
              ],
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/pattern.jpg"), fit: BoxFit.fill)),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
