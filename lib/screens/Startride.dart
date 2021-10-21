import 'dart:async';

import 'package:flutter/material.dart';
import 'package:drivers/screens/Endride.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Startride extends StatefulWidget {
  @override
  _StartrideState createState() => _StartrideState();
}

class _StartrideState extends State<Startride> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('DriverApp'),
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
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                height: 170.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 16.0,
                        spreadRadius: 0.5,
                        offset: Offset(0.7, 0.7),)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:13.0, vertical: 3.0),
                  child: Column(
                      children: <Widget>[
                        SizedBox(height: 6),
                        Text("Rider notified",style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400)),
                        ListTile(
                          leading: Icon(Icons.account_circle_rounded, size: 44,),
                          title: Text("Zunnorain Akhtar", style : TextStyle(fontSize: 23, fontWeight: FontWeight.w600)),
                          trailing: Icon(Icons.call, size: 29, color: Colors.deepPurple),
                          onTap: () => print("Listtile Tapped"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0,),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Endride()),
                              );
                            },
                            child: Text(
                              '                      Start Ride                   ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.deepPurpleAccent,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
              ),
            ),
          ]

      ), );
  }
}
