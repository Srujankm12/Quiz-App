import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        child: Column(
          children: [
            Padding(
              padding:EdgeInsets.only(top: 40.0,left: 20),
              child: Row(
                children: [Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(color: Colors.white10,borderRadius: BorderRadius.circular(60)),
                  child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,)),

                ),
                  SizedBox(width: 120,),
                  Text("sports",style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold

                  ),)
                ],
              ),
            ),
            SizedBox(height: 10,),
            Expanded(

              child: Container(

                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 20.0,top: 40.0,right:20.0 ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                          child: Image.asset("images/rohith.jpeg",
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            fit:BoxFit.cover,)),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(border:Border.all(color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                      child: Text(" DHONI",style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      ),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(border:Border.all(color: Colors.black12,
                      ),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(" ROHITH",style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      ),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(border:Border.all(
                        color: Colors.black12,
                      ),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text("VIRAT",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      ),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(border:Border.all(color: Colors.black12,
                      ),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(" KL RAHUL ",style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      ),),
                    )
              
                  ],
                ),
              
              
              ),
            ),

          ],
        ),

      ),

    );
  }
}
