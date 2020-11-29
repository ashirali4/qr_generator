import 'dart:math';

import 'package:flutter/material.dart';
import 'package:qrgenerator/screens/qrview.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Datamodel.dart';
class Manageqr extends StatefulWidget {
  @override
  _ManageqrState createState() => _ManageqrState();
}

class _ManageqrState extends State<Manageqr> {
  int random;
  TextEditingController cardno=new TextEditingController();
  TextEditingController name=new TextEditingController();
  TextEditingController id=new TextEditingController();
  TextEditingController day=new TextEditingController();
  TextEditingController month=new TextEditingController();
  TextEditingController year=new TextEditingController();

  void initState(){

  }


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var rnd = new Random();
    var next = rnd.nextDouble() * 1000000000000;
    while (next < 100000000000) {
      next *= 10;
    }
    cardno.text=next.toInt().toString();
    return Form(
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width,

        child: Padding(
          padding: const EdgeInsets.only(top: 70,left: 10,right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 170,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(14))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           Expanded(
                             flex:1,
                               child:  Text("Tarjeta de transporte publico",
                             style: TextStyle(
                                 color: Colors.white
                             ),)),
                            Expanded(
                                flex: 1,
                                child: Container(
                                    height: 50,
                                    width: 50,
                                    child: Image.asset("assets/logo.png")) ,

                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.train,color: Colors.white,),
                            SizedBox(width: 05,),
                            Icon(Icons.directions_bus_outlined,color: Colors.white,),
                            SizedBox(width: 05,),
                            Icon(Icons.directions_boat,color: Colors.white,),
                            SizedBox(width: 05,),
                            Icon(Icons.person_pin_circle,color: Colors.white,),
                            SizedBox(width: 05,),
                          ],
                        )
                      ],

                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 05, right: 05,top: 05),
                  child: Text('No. de tarjeta',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 05, right: 05,top: 05,bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: const Offset(0, 1),
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
                        controller: cardno,
                        enabled: false,
                        keyboardType: TextInputType.number,

                        decoration: InputDecoration(
                          border: InputBorder.none,

//                      border: new OutlineInputBorder(
//                          borderSide: new BorderSide(color: Colors.transparent,width: 0.0)),
                          contentPadding:
                          EdgeInsets.only(top: 15,bottom: 15,left: 20,right: 10), // add padding to adjust icon
                          isDense: true,
                          hintText: "000000000000",

                        ),
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 05, right: 05,top: 05),
                  child: Text('No. de Cedula ',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 05, right: 05,top: 05,bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: const Offset(0, 1),
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
                        validator: (value){
                          if (value.isEmpty) {
                            return 'Ingrese algo de texto';
                          }
                          return null;
                        },
                        controller: id,
                        decoration: InputDecoration(
                          border: InputBorder.none,

//                      border: new OutlineInputBorder(
//                          borderSide: new BorderSide(color: Colors.transparent,width: 0.0)),
                          contentPadding:
                          EdgeInsets.only(top: 15,bottom: 15,left: 20,right: 10), // add padding to adjust icon
                          isDense: true,
                          hintText: "000-0000000-0",

                        ),
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 05, right: 05,top: 05),
                  child: Text('Nombre completo',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 05, right: 05,top: 05,bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: const Offset(0, 1),
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
                        validator: (value){
                          if (value.isEmpty) {
                            return 'Ingrese algo de texto';
                          }
                          return null;
                        },
                        controller: name,
                        decoration: InputDecoration(
                          border: InputBorder.none,

//                      border: new OutlineInputBorder(
//                          borderSide: new BorderSide(color: Colors.transparent,width: 0.0)),
                          contentPadding:
                          EdgeInsets.only(top: 15,bottom: 15,left: 20,right: 10), // add padding to adjust icon
                          isDense: true,
                          hintText: "Juan Rod",

                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 05, right: 05,top: 05),
                  child: Text('Fecha de nacimiento',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15
                    ),),
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 05, right: 05,top: 05,bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: const Offset(0, 1),
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
                                validator: (value){
                                  if (value.isEmpty) {
                                    return 'Ingrese algo de texto';
                                  }
                                  return null;
                                },
                                controller: day,
                                keyboardType: TextInputType.number,

                                decoration: InputDecoration(
                                  border: InputBorder.none,

//                      border: new OutlineInputBorder(
//                          borderSide: new BorderSide(color: Colors.transparent,width: 0.0)),
                                  contentPadding:
                                  EdgeInsets.only(top: 15,bottom: 15,left: 20,right: 10), // add padding to adjust icon
                                  isDense: true,
                                  hintText: "31",

                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 05, right: 05,top: 05,bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: const Offset(0, 1),
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
                                validator: (value){
                                  if (value.isEmpty) {
                                    return 'Ingrese algo de texto';
                                  }
                                  return null;
                                },

                                controller: month,
                                keyboardType: TextInputType.number,

                                decoration: InputDecoration(
                                  border: InputBorder.none,

//                      border: new OutlineInputBorder(
//                          borderSide: new BorderSide(color: Colors.transparent,width: 0.0)),
                                  contentPadding:
                                  EdgeInsets.only(top: 15,bottom: 15,left: 20,right: 10), // add padding to adjust icon
                                  isDense: true,
                                  hintText: "13",

                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 05, right: 05,top: 05,bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: const Offset(0, 1),
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
                                validator: (value){
                                  if (value.isEmpty) {
                                    return 'Ingrese algo de texto';
                                  }
                                  return null;
                                },
                                controller: year,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,

//                      border: new OutlineInputBorder(
//                          borderSide: new BorderSide(color: Colors.transparent,width: 0.0)),
                                  contentPadding:
                                  EdgeInsets.only(top: 15,bottom: 15,left: 20,right: 10), // add padding to adjust icon
                                  isDense: true,
                                  hintText: "1985",

                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: RaisedButton(

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(color: Color(0xFFF26624))),
                      onPressed: () async {
                        if(_formKey.currentState.validate()){


                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString('cardno', cardno.text);
                          prefs.setString('name', name.text);
                          prefs.setString('id', id.text);
                          prefs.setString('dob', day.text +"/"+ month.text+"/"+year.text);
                          data mydata=new data(cardno.text,id.text,name.text,day.text +"/"+ month.text+"/"+year.text);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => QrView(mydata)));
                        }
                      },
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text("Guardar cambios".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                  ),
                ),

                SizedBox(height: 30,),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
