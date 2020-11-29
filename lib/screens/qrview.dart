import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../Datamodel.dart';
import 'dashboard.dart';
class QrView extends StatefulWidget {
  data mydata;
  @override

  _QrViewState createState() => _QrViewState();
  QrView(this.mydata);
}

class _QrViewState extends State<QrView> {
  String qrdata;
  @override
  Widget build(BuildContext context) {
    qrdata= "Tarjeta no: "+widget.mydata.cardno +"-ID no : "+widget.mydata.id +" - Nombre :"+widget.mydata.name +"- Fecha de nacimiento :"+widget.mydata.dob ;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            size: 20,
                          ),
                        ),
                      ),
                     Expanded(
                       flex: 40,
                       child:   Center(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Text(this.widget.mydata.name=="-"?"QR no generado.":this.widget.mydata.name,
                             style: TextStyle(
                                 color: Theme.of(context).primaryColor,
                                 fontSize: 16
                             ),
                           ),
                           Text(this.widget.mydata.cardno=="-"?"QR no generado.":this.widget.mydata.cardno,
                             style: TextStyle(
                                 color: Theme.of(context).primaryColor,
                                 fontSize: 16
                             ),
                           ),

                         ],
                       ),
                     ),)
                    ],
                  )
                ),
              )
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Container(
                    child: this.widget.mydata.cardno=='-' ?  Text("QR no generado.",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 25
                      ),
                    ): QrImage(
                      data: qrdata,
                      foregroundColor:Theme.of(context).primaryColor,
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 60,right: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RawMaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                              Dashboard()), (Route<dynamic> route) => false);
                        },
                        elevation: 2.0,
                        fillColor: Colors.white,
                        child: Icon(
                          Icons.home_outlined,
                          color: Theme.of(context).primaryColor,
                          size: 30.0,
                        ),
                        padding: EdgeInsets.all(12.0),
                        shape: CircleBorder(),
                      ),
                      RawMaterialButton(
                        onPressed: () {

                        },
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
                ),
              )
            )
          ],
        ),
      )
    );
  }
}
