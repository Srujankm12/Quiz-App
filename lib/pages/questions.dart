import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizapp/database/database.dart';
import 'package:quizapp/pages/Home_page.dart';

class Question extends StatefulWidget {
  final String category;
  Question({required this.category});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  bool show = false;

  getontheload() async {
    QuizStream = await DatabaseMethods().getCategoryQuiz(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Stream? QuizStream;
  PageController controller = PageController();

  Widget allQuiz() {
    return StreamBuilder(
      stream: QuizStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? PageView.builder(
          controller: controller,
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];
            return  Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        top: 40.0,
                        right: 20.0,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          ds["Image"],
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          show = true;
                        });
                      },
                      child: show
                          ? Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                        ),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:ds["correct"]==ds["option1"]? Colors.green:Colors.red,width: 1.5
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                         child: Text(
                          ds["option1"],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                          : Container(
                        margin: EdgeInsets.only(left: 10,
                            right: 10,
                            top: 10),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:Colors.black87,width: 1.5
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          ds["option1"],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          show = true;
                        });
                      },
                      child: show
                          ? Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                        ),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:ds["correct"]==ds["option2"]? Colors.green:Colors.red,width: 1.5
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          ds["option2"],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                          : Container(
                        margin: EdgeInsets.only(left: 10,
                            right: 10,
                            top: 10),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:Colors.black87,width: 1.5
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          ds["option2"],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          show = true;
                        });
                      },
                      child: show
                          ? Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                        ),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:ds["correct"]==ds["option3"]? Colors.green:Colors.red,width: 1.5
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                         child: Text(
                          ds["option3"],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                          : Container(
                        margin: EdgeInsets.only(left: 10,
                          right: 10,
                          top: 10),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:Colors.black87,width: 1.5
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          ds["option3"],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          show = true;
                        });
                      },
                      child: show
                          ? Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                        ),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:ds["correct"]==ds["option4"]? Colors.green:Colors.red,width: 1.5
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          ds["option4"],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                          : Container(
                        margin: EdgeInsets.only(left: 10,
                        right: 10,
                        top: 10),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:Colors.black87,width: 1.5
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          ds["option4"],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                      ),
                    ),
                    SizedBox(height: 90,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          show=false;
                        });
                        controller.nextPage(duration: Duration(milliseconds:200 ), curve:Curves.bounceIn );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                            ),

                              child: Icon
                                (Icons.arrow_circle_right,
                                color: Colors.black,
                                size: 40,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
            );
          },
        )
            : Container(

        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 40.0,
                left: 20,
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                        }
                        ,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 100),
                  Text(
                    widget.category,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(child: allQuiz()),
          ],
        ),
      ),
    );
  }
}
