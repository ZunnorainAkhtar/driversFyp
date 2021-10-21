import 'package:drivers/screens/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await Firebase.initializeApp();
   runApp(MyApp());
  //runApp(MaterialApp(home: MyApp()));
}
/*DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("users");*/
//final databaseRef = FirebaseDatabase.instance.reference();

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context)  {
    return MaterialApp(
     // debugShowCheckedModeBanner: false,
      debugShowCheckedModeBanner: false,
      title:"DriverApp",
      theme:ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MainPage(),
    );
  }
}
