import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children:[ Container(
                padding:EdgeInsets.only(left: 20.0,top: 50) ,
                height: 220,

                decoration: BoxDecoration(
                  color: Colors.purple,
                    borderRadius:BorderRadius.only(
                bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)


                    ),
                ),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   ClipRRect(
                     borderRadius:BorderRadius.circular(60),

                        child: Image.asset(
                          "images/3.png",
                          width: 70,
                          height: 70,
                        )),
                SizedBox(width: 10.0,),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text("Srujan KM",
                    style: TextStyle(
                        color:Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0

                  ),),
                )


                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,

                decoration: BoxDecoration(color: Colors.teal[200],
                borderRadius: BorderRadius.circular(60)),
                margin: EdgeInsets.only(
                    top:125,
                    left: 20.0,
                right: 20.0),
                child: Center(

                  child: Row(
                    children: [
                      //SizedBox(width: 50,),
                      Image.asset("images/4.jpg",
                        width: 200,height: 200,

                      ),


                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(" GUESS THE\n     IMAGES ",

                            style: TextStyle(
                                color:Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0

                            ),),
                        ],
                      ),
                    ],
                  ),
                ),
              )
    ]),
            SizedBox(height: 20,),
            Text("Top Quiz Categories",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 26,
              ),),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20.0),
              child: Row(
                children: [
                  Container(
                    width:150,

                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white10),

                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("images/object.png"),fit:BoxFit.cover,),
                            ),
                          ),
                            Text("OBJECTS",
                            style: TextStyle(

                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 12,
                            ),),
                        ],
                      )),
                ],

              ),
            )

          ],
        ),
      ),


    );
  }
}
