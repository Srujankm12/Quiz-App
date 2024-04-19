import 'package:flutter/material.dart';
class Addquiz extends StatefulWidget {
  const Addquiz({super.key});

  @override
  State<Addquiz> createState() => _AddquizState();
}

class _AddquizState extends State<Addquiz> {
  String? value;
  final List< String> Quizitems=['Objects','Animal','Place','Fruits','Sports','others'];
  TextEditingController option1controller =new TextEditingController();
  TextEditingController option2controller =new TextEditingController();
  TextEditingController option3controller =new TextEditingController();
  TextEditingController option4controller =new TextEditingController();
  TextEditingController correctcontroller =new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        "Add Quizz",style: TextStyle(
        color: Colors.black,
        fontSize: 35.0,
        fontWeight: FontWeight.bold
      ),
      ),

      ),
body: SingleChildScrollView(
  child: Container(
    margin: EdgeInsets.only(left: 20.0 , right: 20.0,top: 20.0,bottom: 40),
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text("Upload the Quiz picture",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),),
        ),
        SizedBox(height: 20,),
        Center(
          child: Container(
            child:Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border:Border.all(color: Colors.black,width: 1.5),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Icon(Icons.camera_alt_outlined,
                color:Colors.black ,),
              ),
            ),
  
          ),
        ),
        SizedBox(height: 20,),
        Text(
          "Option 1 ",style: TextStyle(
          color: Colors.black87,
          fontSize: 20.0,
          fontWeight: FontWeight.w600
        ),
        ),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.symmetric(horizontal:20.0 ),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
  
          ),
          child: TextField(
            controller: option1controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Enter Option 1",
              hintStyle: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14)
            ),
          ),
  
        ),
        SizedBox(height: 20,),
        Text(
          "Option 2 ",style: TextStyle(
            color: Colors.black87,
            fontSize: 20.0,
            fontWeight: FontWeight.w600
        ),
        ),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.symmetric(horizontal:20.0 ),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
  
          ),
          child: TextField(
            controller: option2controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter Option 2",
                hintStyle: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)
            ),
          ),
  
        ),
        SizedBox(height: 20,),
        Text(
          "Option 3 ",style: TextStyle(
            color: Colors.black87,
            fontSize: 20.0,
            fontWeight: FontWeight.w600
        ),
        ),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.symmetric(horizontal:20.0 ),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
  
          ),
          child: TextField(
            controller: option3controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter Option 3",
                hintStyle: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)
            ),
          ),
  
        ),
        SizedBox(height: 20,),
        Text(
          "Option 4 ",style: TextStyle(
            color: Colors.black87,
            fontSize: 20.0,
            fontWeight: FontWeight.w600
        ),
        ),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.symmetric(horizontal:20.0 ),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
  
          ),
          child: TextField(
            controller: option4controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter Option 4",
                hintStyle: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)
            ),
          ),
  
        ),
        SizedBox(height: 20,),
        Text(
          "Correct option",style: TextStyle(
            color: Colors.black87,
            fontSize: 20.0,
            fontWeight: FontWeight.w600
        ),
        ),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.symmetric(horizontal:20.0 ),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
  
          ),
          child: TextField(
            controller: correctcontroller,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter Correct option",
                hintStyle: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)
            ),
          ),
  
        ),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.symmetric(horizontal:10.0 ),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.brown[50],
            borderRadius:BorderRadius.circular(10),

          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              items: Quizitems.map((item) => DropdownMenuItem(value: item, child: Text(
                item, style: TextStyle(
                fontSize: 19.0,
                color: Colors.black,
              ),
              ),
              ),
              ).toList(),
              onChanged: (newValue) {
                setState(() {
                  this.value = newValue;
                });
              },
              dropdownColor: Colors.white,
              hint: Text("Select Category"),
              iconSize: 30,
              icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
              value: value,
            ),
          ),
        ),
        SizedBox(height: 30.0,),
        Center(
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              width: 150,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Center(
                child: Text(
                  "ADD",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,


                  ),
                ),

              ),
            )
          ),
        )
  
  
  
      ],
  
    )
  ),
),
    );
  }
}
