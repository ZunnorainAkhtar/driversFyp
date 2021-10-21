import 'package:drivers/screens/Startride.dart';
import 'package:drivers/screens/Profile.dart';
import 'package:drivers/screens/About.dart';
import 'package:drivers/screens/LogOut.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class Online extends StatefulWidget {
  @override
  _OnlineState createState() => _OnlineState();
}

class _OnlineState extends State<Online> {

  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;
  String username= "", email="";
  //List<PlacePredictions> placePredictionList=[];


  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('DriverApp'),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 66.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13.0),
                    topRight: Radius.circular(13.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 16.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),)
                ]),
            padding: const EdgeInsets.symmetric(horizontal:119.0, vertical: 7.0),
            child: Text("You are Online.", style: TextStyle(fontSize: 21.0),),
          )
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
        Positioned(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal:12.0, vertical: 7.0,),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Startride()),
                      );
                    },
                    child:Text('  Accept  ', style: TextStyle(fontSize: 21.0)),
                    color:Colors.deepPurpleAccent,
                    textColor:Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:RaisedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Online()),
                      );
                    },
                    child:Text('  Cancel  ', style: TextStyle(fontSize: 21.0)),
                    color:Colors.deepPurpleAccent,
                    textColor:Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            )
        ),
        )
      ],
      ),
      /*drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Zunnorain Akhtar"),
                accountEmail: Text("zunnorainakhtar123@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  child: Text("Z", style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white)),
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
      ),*/

    );


  }
}
