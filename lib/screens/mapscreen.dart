import 'package:flutter/material.dart';
import 'package:qrgenerator/screens/qrview.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Datamodel.dart';
class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String cardno, name, id, dob;
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cardno = (prefs.getString('cardno')??'-');
      name = (prefs.getString('name')??'-');
      id = (prefs.getString('id')??'-');
      dob = (prefs.getString('dob')??'-');

    });
  }
  void initState() {
    super.initState();
    _loadCounter();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.png"),
                  fit: BoxFit.cover
              )
          ),
        ),
        Container(
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20,top: 80),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 25,
                                offset: const Offset(0, 10),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Theme(
                            data: new ThemeData(
                              primaryColor: Colors.transparent,
                              primaryColorDark: Colors.transparent,

                            ),
                            child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                border: InputBorder.none,

//                      border: new OutlineInputBorder(
//                          borderSide: new BorderSide(color: Colors.transparent,width: 0.0)),
                                contentPadding:
                                EdgeInsets.only(top: 14,bottom: 10,left: 20,right: 10), // add padding to adjust icon
                                isDense: true,
                                hintText: "Buscar aqui",
                                suffixIcon: Padding(
                                  padding:
                                  EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 20), // add padding to adjust icon
                                  child: Icon(Icons.mic, size: 25,color: Theme.of(context).primaryColor,),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ), Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60,right: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RawMaterialButton(
                          onPressed: () {

                            data mydata=new data(cardno,id,name,dob);
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => QrView(mydata)));

                          },
                          elevation: 2.0,
                          fillColor: Colors.white,
                          child: Icon(
                            Icons.qr_code_scanner,
                            color: Theme.of(context).primaryColor,
                            size: 30.0,
                          ),
                          padding: EdgeInsets.all(12.0),
                          shape: CircleBorder(),
                        ),
                        RawMaterialButton(
                          onPressed: () {},
                          elevation: 2.0,
                          fillColor: Colors.white,
                          child: Icon(
                            Icons.favorite,
                            color: Theme.of(context).primaryColor,
                            size: 30.0,
                          ),
                          padding: EdgeInsets.all(12.0),
                          shape: CircleBorder(),
                        ),

                      ],
                    ),
                  )
              )
            ],
          ),
        )

      ],
    );
  }
}
