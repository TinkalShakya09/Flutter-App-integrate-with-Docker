import 'package:flutter/material.dart';

class DockerCLIHelp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text("Help"),
        ),
        body: SingleChildScrollView(
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                
                margin: EdgeInsets.fromLTRB(deviceWidth*0.05, deviceWidth*0.1, deviceWidth*0.05,deviceWidth*0.9),
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
                  children:<Widget> [
                        Padding(
                    padding: EdgeInsets.fromLTRB(8, 15, 8, 8),
                    child: Center(
                        child: Text("Docker CLI Help",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold))),
                    ),
                       
                        SizedBox(height: 20,),
                        new Container(
                         child: Text("In this app, You can Run the linux Commands and also run the docker commands like -  \n-date  \n-cal \n-ifconfig \n-whoami \n-docker ps \n-docker images \n-and much more",
                         textAlign: TextAlign.justify,
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.w600,
                           ),),
                    ),],
                ),
              ),
            ],
          ),
        ),
        );
  }
}