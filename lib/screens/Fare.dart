import 'dart:async';

import 'package:drivers/screens/Online.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Fare extends StatefulWidget {
  @override
  _FareState createState() => _FareState();
}

class _FareState extends State<Fare> {

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
        title: Text("DriverApp"),
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
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:24.0, vertical: 18.0),
                    child: Column(
                        children: <Widget>[
                          Text("Your trip has been completed", style : TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                          Text("Total Fare: PKR 99.9", style : TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                          Padding(
                            padding: const EdgeInsets.all(9.0,),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Online()),
                                );
                              },
                              child: Text(
                                '                 Submit                  ',
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
            ),
          ]
      ),
    );
  }
}
