import 'package:drivers/Models/drivers.dart';
import 'package:drivers/screens/HomeScreen.dart';
import 'package:drivers/screens/ForgotPassword.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
//import 'package:firebase_database/firebase_database.dart';


class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  GlobalKey<FormState> formkey =GlobalKey<FormState>();
  void validate(){
    if(formkey.currentState!.validate()){
      print("Validated");
    }else{
      print("Not Validated");
    }
  }
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final databaseRef = FirebaseDatabase.instance.reference();

  // late User firebaseUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child:Card(
            child: Column(
              children: <Widget>[
                Form(
                  autovalidate: true,
                  key: formkey,
                  child:Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:Column(
                        children:<Widget>[
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration:InputDecoration(
                                hintText: "abc@gmail.com", labelText: "Email"),
                            validator: MultiValidator(
                                [
                                  RequiredValidator(errorText: "Required"),
                                  EmailValidator(errorText: "Not A Valid Email"),
                                ]
                            ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration:InputDecoration(
                              hintText: "Enter Password", labelText: "Password",),
                            validator: MultiValidator(
                                [
                                  RequiredValidator(errorText: "Required"),
                                  MinLengthValidator(6, errorText: "should contain at least 6 characters"),
                                ]
                            ),
                          ),
                        ]
                    ),
                  ),
                ),
                SizedBox(height:20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      child:Text('   LOGIN   ',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color:Colors.deepPurple,
                      textColor:Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: ()async{

                        if(formkey.currentState!.validate()){
                          setState(() {
                            signInWithEmailAndPassword();
                          });

                        }

                      }
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Forgot Password?"),
                    TextButton(
                        child:Text("click here") ,
                        onPressed: (){ Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPassword()),
                        );
                        })
                  ],

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose()  {
    emailController.dispose();
    super.dispose();
  }
  void signInWithEmailAndPassword()async{
    try{
      CollectionReference drivers = FirebaseFirestore.instance.collection('drivers');
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final User user = (await _auth.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim())).user!;

      if (user!=null){
        final  currentUser = await drivers.doc(user.uid).get();
  
        prefs.setString('userId', user.uid);
        prefs.setString('username', currentUser.get("username"));
        prefs.setString('email', currentUser.get("email"));
        prefs.setString('phone', currentUser.get("phone"));

        Fluttertoast.showToast(msg: "Signed In successfully");
        Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => HomeScreen()),
         );
      }


    }catch(e){
      print(e);
      Fluttertoast.showToast(msg: e.toString());
    }

  }
}

