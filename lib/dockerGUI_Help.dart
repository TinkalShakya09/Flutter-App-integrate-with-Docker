import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DockerGUIHelp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text("Help"),
        ),
        body: SingleChildScrollView(
          child: Container(
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
              
            crossAxisAlignment: CrossAxisAlignment.stretch,
              children:<Widget> [
                new Card(
                  child: Column(
                    children:<Widget> [
                      Padding(
                  padding: EdgeInsets.fromLTRB(8, 15, 8, 8),
                  child: Center(
                      child: Text("Docker GUI Help",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold))),
                ),
                     ],),),
                Column(
                  children: [
                    SizedBox(height: 10,),
                    new Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                     child: Text("In this app, we can Run the docker container, check the running container, total dokcer images and also delete the running images or container, In the backend server run the commands for help to run easily docker containers and many things. and you have to no need to run the commands. you can filled the text and directly run it. But I exaplain the backend server Running commands ",
                     textAlign: TextAlign.justify,
                     style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.w500,
                       ),),

                    ),],),
                      Column(
                        children: [
                          SizedBox(height: 10,),
                          new Container(                    
                           child: Text("Running Docker Commands ",
                           textAlign: TextAlign.justify,
                           style: TextStyle(
                             fontSize: 25,
                             fontWeight: FontWeight.w600,
                             ),),),
                             SizedBox(height:8.0),
                          new Container(
                            margin: EdgeInsets.fromLTRB(10, 3, 10, 0),
                            child: Text("Docker Run Command                                    ",
                           textAlign: TextAlign.left,
                           style: TextStyle(
                             fontSize: 22,
                             fontWeight: FontWeight.w600,
                             ),),
                          ),
                          new Container(
                            child: Text("docker run -it --name <docker_name> <image name> ",
                           textAlign: TextAlign.left,
                           
                           style: TextStyle(
                             color: Colors.blue,
                             fontSize: 16,
                             fontWeight: FontWeight.w600,
                             ),),
                          ),
                          new Container(
                            margin: EdgeInsets.fromLTRB(10, 3, 10, 0),
                            child: Text("For Example - you give any docker name like - 'Mywab', 'Mycontainer' and image name are fix.          if you want to install ubuntu image then you can give. ",
                           textAlign: TextAlign.justify,
                           
                           style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.w600,
                             ),),
                          ),
                          SizedBox(height:10.0),
                          new Container(
                            margin: EdgeInsets.fromLTRB(10, 3, 10, 0),
                            child: Text("Docker ps Command                                      ",
                           textAlign: TextAlign.left,
                           style: TextStyle(
                             fontSize: 22,
                             fontWeight: FontWeight.w600,
                             ),),
                          ),
                          new Container(
                            child: Text("docker ps ",
                           textAlign: TextAlign.left,
                           
                           style: TextStyle(
                             color: Colors.blue,
                             fontSize: 16,
                             fontWeight: FontWeight.w600,
                             ),),
                          ),
                          new Container(
                            margin: EdgeInsets.fromLTRB(10, 3, 10, 0),
                            child: Text("This command help to check the all running container. ",
                           textAlign: TextAlign.left,      
                           style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.w600,
                             ),),
                          ),
                          SizedBox(height:10.0),
                          new Container(
                            margin: EdgeInsets.fromLTRB(10, 3, 10, 0),
                            child: Text("Docker images Command                                    ",
                           textAlign: TextAlign.left,
                           style: TextStyle(
                             fontSize: 22,
                             fontWeight: FontWeight.w600,
                             ),),
                          ),
                          new Container(
                            child: Text("docker images ",
                           textAlign: TextAlign.left,
                           
                           style: TextStyle(
                             color: Colors.blue,
                             fontSize: 16,
                             fontWeight: FontWeight.w600,
                             ),),
                          ),
                          new Container(
                            margin: EdgeInsets.fromLTRB(10, 3, 10, 0),
                            child: Text("This command help to check the all downloaded imamges/containers. ",
                           textAlign: TextAlign.left,      
                           style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.w600,
                             ),),
                          ),
                          SizedBox(height:10.0),
                          new Container(
                            margin: EdgeInsets.fromLTRB(10, 3, 10, 0),
                            child: Text("Delete images Command                                    ",
                           textAlign: TextAlign.left,
                           style: TextStyle(
                             fontSize: 22,
                             fontWeight: FontWeight.w600,
                             ),),
                          ),
                          new Container(
                            
                            child: Text("docker rm -f <docker_name> ",
                           textAlign: TextAlign.left,
                           
                           style: TextStyle(
                             color: Colors.blue,
                             fontSize: 16,
                             fontWeight: FontWeight.w600,
                             ),),
                          ),
                          new Container(
                            margin: EdgeInsets.fromLTRB(10, 3, 10, 20),
                            child: Text("This command help to delete any conatainer/image as you wish. ",
                           textAlign: TextAlign.left,      
                           style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.w600,
                             ),),
                          ),
                          ],),
                     Column(
                       children: [
                         SizedBox(height: 10,),
                         new Container(
                           
                          child: Text("More Information about the docker you can click these links",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            ),),

                         ),
                         ],), 
                       SizedBox(height: 20,),
                      new Container(
                        margin: EdgeInsets.only(bottom: 30),
                      child: new InkWell(
                        child: new Text("1. https://docs.docker.com/get-started/overview",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w900,fontSize: 20),),
                        onTap: () => launch("https://docs.docker.com/get-started/overview/"),
                      ),
                    ),
                    new Container(
                        margin: EdgeInsets.only(bottom: 30),
                      child: new InkWell(
                        child: new Text("2. https://www.tutorialspoint.com/docker/index.htm",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w900,fontSize: 20),),
                        onTap: () => launch("https://www.tutorialspoint.com/docker/index.htm"),
                      ),
                    ),
              ],
            ),
          ),
        ),
        );
  }
}
