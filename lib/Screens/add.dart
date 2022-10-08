// @dart = 2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Comm/button.dart';
import '../Comm/dropdown.dart';
import '../Comm/textField.dart';
import 'final.dart';

class design extends StatefulWidget {
  String data;
  String condition;
  List<String> lensType;
  List list;
  design({Key key, this.data, this.condition, this.lensType, this.list})
      : super(key: key);

  @override
  State<design> createState() => _designState(data, condition);
}

class _designState extends State<design> {
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
  String id;
  List<String> index = ["      "];
  List<String> coating = ["      "];
  List<String> treatment = ["      "];
  List<String> des = ["      "];
  List<String> cylinder = ["      "];
  List<String> trpower = ["      "];
  _designState(this.data, this.condition);

  @override
  void initState() {
    super.initState();
    dvlt = (widget.lensType).first;
    data = (widget.lensType).first;
    setState(() {
      getDesign();
      getIndex();
      getCoat();
      getTreat();
      getTrp();
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
  }

  getDesign() {
    des.clear();
    for (int i = 0; i < widget.list.length; i++) {
      if (!(des.contains(widget.list[i]['design']))) {
        des.add(widget.list[i]['design']);
      }
    }
    dvdesign = des.first;
    desi = des.first;
  }

  getIndex() {
    index.clear();
    for (int i = 0; i < widget.list.length; i++) {
      if (!(index.contains(widget.list[i]['index']))) {
        index.add(widget.list[i]['index']);
      }
    }
    dvind = index.first;
    inde = index.first;
  }

  getCoat() {
    coating.clear();
    for (int i = 0; i < widget.list.length; i++) {
      if (!(coating.contains(widget.list[i]['coat']))) {
        coating.add(widget.list[i]['coat']);
      }
    }
    dvcoat = coating.first;
    coat = coating.first;
  }

  getTreat() {
    treatment.clear();
    for (int i = 0; i < widget.list.length; i++) {
      if (!(treatment.contains(widget.list[i]['treat']))) {
        treatment.add(widget.list[i]['treat']);
      }
    }
    dvtreat = treatment.first;
    treat = treatment.first;
  }

  getTrp() {
    trpower.clear();
    for (int i = 0; i < widget.list.length; i++) {
      if (!(trpower.contains(widget.list[i]['trp']))) {
        trpower.add(widget.list[i]['trp']);
      }
    }
    dvtrp = trpower.first;
    trpo = trpower.first;
  }

  getCyl() {
    cylinder.clear();
    for (int i = 0; i < widget.list.length; i++) {
      if (!(cylinder.contains(widget.list[i]['cyl']))) {
        cylinder.add(widget.list[i]['cyl']);
      }
    }
    dvcyl = cylinder.first;
    cyli = cylinder.first;
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
                    items: trpower,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => cyl(
                                data: lensTyp.text,
                                desi: desig.text,
                                inde: ind.text,
                                id: id,
                                condition: condition,
                                coat: coatin.text,
                                cyli: cylinde.text,
                                treat: treatmen.text,
                                trpower: trpowe.text,
                                price: pric.text,
                                list: widget.list)));
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
