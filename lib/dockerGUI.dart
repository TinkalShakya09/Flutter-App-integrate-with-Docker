
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp3/dockerGUI_Help.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DockerGUI extends StatefulWidget {
  @override
  _DockerGUIState createState() => _DockerGUIState();
}

class _DockerGUIState extends State<DockerGUI> {
  var fs = FirebaseFirestore.instance;

  String cmd="",cn="",del="";
  var output;
  String getans="";
  String newvalue="";

  mydata() async {
    var url = Uri.http("13.234.205.178", "/cgi-bin/cmd.py",{"x": cmd,"y": cn});
    var r = await http.get(url);
    var data = r.body;
    output = data;
  }
   running() async {
    var url = Uri.http("13.234.205.178", "/cgi-bin/running.py");
    var r = await http.get(url);
    var data = r.body;
    output = data;
  }
  images() async {
    var url = Uri.http("13.234.205.178", "/cgi-bin/images.py");
    var r = await http.get(url);
    var data = r.body;
    output = data;
  }
  delete() async {
    var url = Uri.http("13.234.205.178", "/cgi-bin/delete.py",{"x": del});
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
    var msgtextcontroller = TextEditingController();
    var deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
          title: Text('Docker GUI'),
          actions: <Widget>[

        IconButton(
          icon: Icon(Icons.help_outline_rounded),
          tooltip: "Save Todo and Retrun to List",
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
              Color(0xFFFFFFFF),
              Color(0xFF37FDFC),

          ]),
          ),
            child: Column(
              children: <Widget>[
                SizedBox(height: deviceWidth*0.05,),
                Container(                  
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 5, 8, 8),
                        child: Center(
                            child: Text("Docker Run GUI",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold))),
                      ),                   
                    ],
                  ),
                ),
                new Container(
                  child: Row(
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.only(left: deviceWidth*0.03),
                      
                        width: deviceWidth * 0.40,
                        child: TextField(                        
                        onChanged: (value){
                            cn=value;
                    },
                    
                    autocorrect: false,
                    textInputAction: TextInputAction.send,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        fillColor: Colors.lightGreen,
                        labelText: 'Enter Docker Name',
                        border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: new BorderSide(
                              color: Colors.lightGreen,
                            ))),
                  ),
                      ),
                      SizedBox(width:deviceWidth*0.1,height: deviceWidth*0.05),
                      new Container(
                        
                        width: deviceWidth * 0.40,
                        child: TextField(                      
                        onChanged: (value){
                            cmd=value;
                    },                  
                    autocorrect: false,
                    textInputAction: TextInputAction.send,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        fillColor: Colors.lightGreen,
                        labelText: 'Enter Docker image',
                        border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: new BorderSide(
                              color: Colors.lightGreen,
                            ))),
                  ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  child: Column(
                    children: <Widget>[
                      new Container(
                                            
                  height: deviceWidth * 0.1,
                  width: deviceWidth * 0.40,
                  
                  margin: EdgeInsets.only(top: deviceWidth*0.03),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                    ),),
                    child: Text('Run',style: TextStyle(fontSize: 24),),
                    onPressed: () async {
                      
                          msgtextcontroller.clear();
                          await mydata();
                          await fs.collection("commands").add({
                            "cmd": cmd,
                            "Dname": cn,
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
                    ],
                  ),
                ),
                new Container(
                  child: new Row(
                    children: [
                      new Container(                    
                    height: deviceWidth * 0.12,
                    width: deviceWidth * 0.45,
                    margin: EdgeInsets.only(top:deviceWidth*0.03,left:deviceWidth*0.03),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      ),),
                      child: Text('Running Images',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
                      onPressed: () async {
                        
                            msgtextcontroller.clear();
                            await running();
                            await fs.collection("commands").add({
                              "output": output,
                            }).then((value) {
                              print(value.id);
                              print(output);
                              newvalue = value.id;
                              getansdisplay();
                            });
                      },
                    ),
                      ),
                      new Container(                    
                    height: deviceWidth * 0.12,
                    width: deviceWidth * 0.43,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      ),),
                      child: Text('Docker Images',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
                      onPressed: () async {
                        
                            msgtextcontroller.clear();
                            await images();
                            await fs.collection("commands").add({
                              "output": output,
                            }).then((value) {
                              print(value.id);
                              print(output);
                              newvalue = value.id;
                              getansdisplay();
                            });
                      },
                    ),
                      )
                    ],
                  ),
                ),
              new Container(
                child: new Row(
                  children: [
                    SizedBox(height: 30,),
                    new Container(
                      margin: EdgeInsets.fromLTRB(10, 20, 0, 10),
                      
                        width: deviceWidth * 0.40,
                        child: TextField(
                          
                        onChanged: (value){
                            del=value;
                    },
                    
                    autocorrect: false,
                    textInputAction: TextInputAction.send,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        fillColor: Colors.lightGreen,
                        labelText: 'Enter Docker Name',
                        suffixText: "for Deleting",
                        border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: new BorderSide(
                              color: Colors.lightGreen,
                            ))),
                  ),
                    ),
                    new Container(                    
                  height: deviceWidth * 0.12,
                  width: deviceWidth * 0.45,
                  margin: EdgeInsets.only(top: 10,left: 10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                    ),),
                    child: Text('Delete Image',
                    style: TextStyle(fontSize: 20),),
                    onPressed: () async {
                      
                          msgtextcontroller.clear();
                          await delete();
                          await fs.collection("commands").add({
                            "cmd": del,
                            "output": output,
                          }).then((value) {
                            print(value.id);
                            print(del);
                            print(output);
                            newvalue = value.id;
                            getansdisplay();
                          });
                    },
                  ),
                    )
                  ],
                ),
              ),
                 SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.all(deviceWidth*0.05),
                            height: deviceWidth* 1.05,
                            width: deviceWidth* 0.9,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              border: Border.all(color: Colors.lightBlueAccent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(10),
                            
                            child: Text("$getans",
                          style: TextStyle(color: Colors.yellowAccent.shade700,),),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        )
        );
  }
}
 Route _createRoute() {
    return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => DockerGUIHelp(),
    
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