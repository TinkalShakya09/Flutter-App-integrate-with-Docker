
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp3/dockerCLI_Help.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


// ignore: must_be_immutable

class DockerCLI extends StatefulWidget {
  @override
  _DockerCLIState createState() => _DockerCLIState();
}

class _DockerCLIState extends State<DockerCLI> {
  
   var msgtextcontroller = TextEditingController();

  var fs = FirebaseFirestore.instance;

  String cmd="";
  String output="";
  String getans="";
  String newvalue="";

  mydata() async {
    var url = Uri.http("13.234.205.178", "/cgi-bin/linux.py",{"x":cmd});
    var r = await http.get(url);
    var data = r.body;
    output = data;
  }

  getansdisplay() async {
    await fs.collection("commands").doc(newvalue).get().then((value) {
      var data = value.data;
      print(data()!['output']);
      setState(() {
        getans = data()!['output'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
          title: Text('Linux Terminal'),
          actions: <Widget>[

        IconButton(
          icon: Icon(Icons.help_outline_rounded),
          onPressed: () {
            Navigator.of(context).push(_createRoute(),
                  );
          },
        )
      ],
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
            
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF37FDFC),
              Color(0xFFFFFFFF),
          ]),
          ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                  child: Center(
                      child: Text("Linux Terminal",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold))),
                ),
                SizedBox(height:deviceWidth* 0.1),
                Container(
                  width: deviceWidth * 0.70,
                  child: TextField(                 
                    autocorrect: false,
                    textInputAction: TextInputAction.send,
                    decoration: InputDecoration(
                        fillColor: Colors.lightGreen,
                        labelText: 'Enter command',
                        border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: new BorderSide(
                              color: Colors.lightGreen,
                            ))),
                    onChanged: (value) {
                      cmd = value;
                    },
                  ),
                ),
                SizedBox(
                  height:deviceWidth*0.1,
                ),
                Container(
                  height: deviceWidth * 0.13,
                  width: deviceWidth * 0.50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                    ),),
                    child: Text('Execute Command',),
                    onPressed: () async {
                      msgtextcontroller.clear();
                      await mydata();
                      await fs.collection("commands").add({
                        "cmd": cmd,
                        "output": output,
                      }).then((value) {
                        print(value.id);
                        print(cmd);
                        print(output);
                        newvalue = value.id;
                        getansdisplay();
                      });
                    },
                  ),
                ),
                
                SingleChildScrollView(
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.all(deviceWidth*0.05),
                       height: deviceWidth* 1.1,
                            width: deviceWidth* 0.9,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        border: Border.all(color: Colors.lightBlueAccent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      
                      child: Text("[root@localhost ~]# $cmd \n$getans",
                            style: TextStyle(color: Colors.yellowAccent.shade700,),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Route _createRoute() {
    return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => DockerCLIHelp(),
    
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
     
      return SlideTransition(
    position: Tween(
            begin: Offset(1.0, 0.0),
            end: Offset(0.0, 0.0))
        .animate(animation),
    child: child,
);
    },
  );
}