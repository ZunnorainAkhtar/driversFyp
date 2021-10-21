import 'package:drivers/screens/LogIn.dart';
import'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("DriverApp"),
      ),
      body:Container(
        color:Colors.white54,
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        //Center(
        //child:Padding(
        //padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child:SingleChildScrollView (

            child:Column(
                children:<Widget>[
                  SizedBox(height:140),
                  Container(
                      padding: const EdgeInsets.all(16),
                      alignment:Alignment.center,
                      width:100,
                      height:100,
                      child:Text("D",
                          style:TextStyle(
                            color:Colors.white,
                            fontWeight:FontWeight.bold,
                            fontStyle:FontStyle.italic,
                            fontSize:50,
                          )),

                      decoration:BoxDecoration(
                        color:Colors.deepPurple,
                        shape:BoxShape.circle,
                        gradient:LinearGradient(
                            colors:[Colors.black12,Colors.deepPurple]),
                        boxShadow:[BoxShadow(color: Colors.grey,blurRadius:8,offset:Offset(2.0,5.0))],
                      )

                  ),
                  SizedBox(height:10),
                  Text("DRIVER APP",style:TextStyle(fontSize:35,fontWeight:FontWeight.bold)),
                  SizedBox(height: 10,),
                  Text("Logistics Support System",style:TextStyle(fontSize:25,fontWeight:FontWeight.w300)),
                  SizedBox(height:40),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogIn()),
                        );
                      },
                      child: Text(
                        '          LOGIN         ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.deepPurple,
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
    );

  }
}