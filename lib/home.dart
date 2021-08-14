
import 'package:firebaseapp3/dockerGUI.dart';
import 'package:firebaseapp3/dockerCLI.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.menu)],
        centerTitle: true,
        title: Text('Docker App '),
        backgroundColor: Colors.lightBlueAccent,
        
      ),
      body: SingleChildScrollView(
        child: Center(        
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(               
                decoration: BoxDecoration(
                  color: Colors.white,              
                  image: new DecorationImage(
                    fit: BoxFit.contain,
                    colorFilter: 
                      ColorFilter.mode(Colors.white.withOpacity(0.2), 
                      BlendMode.dstIn),
                    image: AssetImage("assets/icon/docker1.png"),
                    
                  ),
                ),
                child: Column(                   
                  children: <Widget>[
                    SizedBox(
                    height: deviceWidth*0.18,
                  ),
                    Container(
                      width: deviceWidth*0.95,
                     child: Text("Docker Container Run",
                  style: TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.blueGrey,
                        offset: Offset(3.0, 3.0)
                      )
                    ],
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700,
                          color: Colors.lightBlueAccent)),
                    ),
                    SizedBox(
                    height: deviceWidth*0.18,
                  ),
                    Container(
                      decoration: BoxDecoration(color: Colors.black,
                      borderRadius: new BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          offset: const Offset(3.0, 3.0),
                          blurRadius: 6.0,
                          spreadRadius: 3.0,
                          )]),

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom( 
                          shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30)),
                          primary: Colors.greenAccent, 
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                        child: Text('Docker Run CLI',),
                        
                        onPressed: () {
                            Navigator.of(context).push(_createRoute(),
                            );
                        }
                      ),
                    ),
                     
                    SizedBox(
                    height: deviceWidth*0.1,
                  ),
                    new Container(
                      margin: EdgeInsets.only(bottom: deviceWidth*0.7),
                      decoration: BoxDecoration(color: Colors.black,
                      borderRadius: new BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          offset: const Offset(3.0, 3.0),
                          blurRadius: 6.0,
                          spreadRadius: 3.0,
                          )]),

                      child: ElevatedButton(   
                        style: ElevatedButton.styleFrom(  
                          shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30)),          
                          primary: Colors.greenAccent,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                        onPressed: () {
                           Navigator.of(context).push(_createRoutes());},
                      child: Text("Docker Run GUI",style: TextStyle(color: Colors.white),)
                      ),
                    ),
                    
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => DockerCLI(),
    transitionDuration: Duration(milliseconds: 1000),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
Route _createRoutes() {
    return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => DockerGUI(),
    transitionDuration: Duration(milliseconds: 1000),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
