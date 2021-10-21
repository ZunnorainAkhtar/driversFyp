import 'package:drivers/screens/About.dart';
import 'package:drivers/screens/LogOut.dart';
import 'package:drivers/screens/Online.dart';
import 'package:drivers/screens/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:provider/provider.dart';
import 'dart:async';

import '../preferencesMethods.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;
  String username= "", email="";



  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  
  @override
  void initState() {
    super.initState();

    final prefs = PreferencesMethods();
    prefs.getUserDetails('email').then((email) {
      prefs.getUserDetails('username').then((username) {
        this.setState(() {
          this.username= username.toString();
          this.email= email.toString();
        });
      });
    });
  }



  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DriverApp"),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 72.0,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal:119.0, vertical: 18.0),
            child: Text("You are Offline.", style: TextStyle(fontSize: 21.0),),
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox.fromSize(
        size: Size.square(99),

        child:FloatingActionButton(
          shape: CircleBorder(
            side: BorderSide( color: Colors.deepPurpleAccent, width: 11),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Online()),
            );
          },

          child: Text(
            ' GO ',
            style: TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      body: Stack(
        children: [
          GoogleMap(

            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,

            onMapCreated: (GoogleMapController controller)
            {
              _controllerGoogleMap.complete(controller);
              newGoogleMapController =controller;


            },
          ),


        ],

      ),


      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text(username),
                accountEmail: Text(email),
                currentAccountPicture: CircleAvatar(
                  child: Text(username.substring(0,1).toUpperCase(), style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white)),
                )),
            ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile"),
                //trailing: Icon(Icons.edit),
                //onTap: () => print("Listtile Tapped"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );}
            ),
            ListTile(
                leading: Icon(Icons.people_rounded),
                title: Text("About"),
                //trailing: Icon(Icons.edit),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => About()),
                  );}
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              //trailing: Icon(Icons.edit),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogOut()),
                );
              },
            )

          ],

        ),//
      ),
    );

  }
}
