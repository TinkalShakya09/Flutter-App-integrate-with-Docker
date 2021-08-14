
import 'dart:async';
import 'package:firebaseapp3/dockerGUI.dart';
import 'package:firebaseapp3/dockerCLI.dart';
import 'package:firebaseapp3/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
Future<void> main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
SystemChrome.setSystemUIOverlayStyle(
  SystemUiOverlayStyle(statusBarColor: Colors.transparent));
runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: "loding",
  routes: {
    "loding":(context) => Loading(),
    "home":(context) => Home(),
    "dockerCLI":(context) => DockerCLI(),
    "dockerGUI":(context) => DockerGUI(),
  },
));
}
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), ()=> Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context)=>Home())));
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFF37FDFC),
          ]),
          ),
          child: Column(            
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Column(
              children: [
                Image.asset("assets/icon/docker1.png",
                height: 200,
                width: 200,
                ),
              ],
            ),
            Text("Docker Conatainer Run",
            style: TextStyle(              
              color:Colors.blueAccent,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),),     
            CircularProgressIndicator()      
          ],),
          
      ),
    );
  }
}
