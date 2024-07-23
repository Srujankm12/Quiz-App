import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizapp/database/database.dart';
import 'package:random_string/random_string.dart';

class Addquiz extends StatefulWidget {
  const Addquiz({Key? key}) : super(key: key);

  @override
  State<Addquiz> createState() => _AddquizState();
}

class _AddquizState extends State<Addquiz> {
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = File(image!.path);
    });
  }

  uploadItem() async {
    if (selectedImage != null &&
        option1controller.text.isNotEmpty &&
        option2controller.text.isNotEmpty &&
        option3controller.text.isNotEmpty &&
        option4controller.text.isNotEmpty &&
        correctController.text.isNotEmpty) {
      String addId = randomAlphaNumeric(10);

      final Reference firebaseStorageRef = FirebaseStorage.instance.ref().child("blogImage").child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
      final snapshot = await task;
      final String downloadUrl = await snapshot.ref.getDownloadURL();

      Map<String, dynamic> addQuiz = {
        "Image": downloadUrl.trim(),
        "option1": option1controller.text.trim(),
        "option2": option2controller.text.trim(),
        "option3": option3controller.text.trim(),
        "option4": option4controller.text.trim(),
        "correct": correctController.text.trim(),
      };

      await DatabaseMethods().addQuizCategory(addQuiz, value!).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.cyan,
          content: Text(
            "Quiz added Successfully",
            style: TextStyle(fontSize: 18.0),
          ),
        ));

        // Reset fields after successful upload
        resetFields();
      }).catchError((error) {
        print("Error uploading quiz: $error");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Failed to add quiz. Please try again.",
            style: TextStyle(fontSize: 18.0),
          ),
        ));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          "Please fill in all fields and select an image.",
          style: TextStyle(fontSize: 18.0),
        ),
      ));
    }
  }

  void resetFields() {
    setState(() {
      selectedImage = null;
      option1controller.clear();
      option2controller.clear();
      option3controller.clear();
      option4controller.clear();
      correctController.clear();
      value = null; // Reset the dropdown value
    });
  }

  String? value;
  final List<String> Quizitems = [
    'Objects',
    'Animal',
    'Place',
    'Fruits',
    'Sports',
    'Others'
  ];
  TextEditingController option1controller = TextEditingController();
  TextEditingController option2controller = TextEditingController();
  TextEditingController option3controller = TextEditingController();
  TextEditingController option4controller = TextEditingController();
  TextEditingController correctController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Add Quiz",
            style: TextStyle(
              color: Colors.black,
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(

            margin: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Upload the Quiz picture",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                ),
           selectedImage == null
              ? GestureDetector(
            onTap: () {
              getImage();
            },
            child: Center(
              child: Container(
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(Icons.add_a_photo), // Placeholder
                  ),
                ),
              ),
            ),
          )
              : Center(
               child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: FileImage(selectedImage!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

            SizedBox(height: 20),
                // Option 1 TextField
                Text(
                  "Option 1",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
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
                    controller: correctController,
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
                GestureDetector(
                  onTap: (){
                    uploadItem();
                  },
                  child: Center(
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
                  ),
                )



              ],

            )
        ),
      ),
    );
  }
}