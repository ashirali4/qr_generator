import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'manageqr.dart';
import 'mapscreen.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();


  int currentindex=0;
  List<Widget> mypages=[
    MapScreen(),
    Manageqr()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,

        key: _drawerKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              _drawerKey.currentState.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: Column(
            children: [
              Expanded(flex: 5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 15),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.start,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    child: Image.asset("assets/image.png"),
                                    height: 70,
                                    width: 70,
                                  ),
                                ),
                                SizedBox(
                                  height: 05,
                                ),
                                Center(
                                  child: Container(
                                    child: Text(
                                      "Liyismel Sanchez",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(.8),
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 05,
                                ),
                                Center(
                                  child: Container(
                                    child: Text(
                                      "liyismel4@gmail.com",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(.8),
                                          fontSize: 13),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      side: BorderSide(color: Color(0xFFF26624))),
                                  onPressed: () {},
                                  color: Colors.red,
                                  textColor: Colors.white,
                                  child: Text("Gestiona Tu Cuenta".toUpperCase(),
                                      style: TextStyle(fontSize: 14)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Home',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onTap: () {
                        setState(() {
                          currentindex=0;
                          Navigator.pop(context);

                        });
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Gentionar tarjeta',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onTap: () {
                        setState(() {
                          currentindex=1;
                          Navigator.pop(context);
                        });
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Configurar opciones de pago',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Tus viajes',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                  ],
                ),
              ),
              ),
              Expanded(flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(

                      top: BorderSide( //                    <--- top side
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Politicas de privacidad',
                            style: TextStyle(color: Theme.of(context).primaryColor),
                          ),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Idioma',
                            style: TextStyle(color: Theme.of(context).primaryColor),
                          ),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                          },
                        ),

                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ),
        body: mypages[currentindex]
    );
  }
}
