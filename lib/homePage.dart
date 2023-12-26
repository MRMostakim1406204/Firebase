import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealtimedatabaseInsert extends StatefulWidget {
  const RealtimedatabaseInsert({super.key});

  @override
  State<RealtimedatabaseInsert> createState() => _RealtimedatabaseInsert();
}

class _RealtimedatabaseInsert extends State<RealtimedatabaseInsert> {

 var nameController = TextEditingController();
 var ageController = TextEditingController();
 var salaryController = TextEditingController();
 final databaseRef = FirebaseDatabase.instance.ref();
 var child = "Student";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inserting Data"),
        centerTitle: true,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,top: 20,bottom: 30,
            ),
            child: Text("Inserting Data In Firebase Database",style: TextStyle(
              fontSize: 25,color: Colors.black,fontWeight: FontWeight.w500
            ),),
          ),
         // SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter your name",
                labelText: "Name",
                border: OutlineInputBorder()
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: ageController,
              decoration: InputDecoration(
                hintText: "Enter your age",
                labelText: "Age",
                border: OutlineInputBorder()
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: salaryController,
              decoration: InputDecoration(
                hintText: "Enter your salary",
                labelText: "Salary",
                border: OutlineInputBorder()
              ),
            ),
          ),
          SizedBox(height: 50),
              MaterialButton(
                minWidth: 300,
                height: 50,
                child: Text("Insert Data",style: TextStyle(
                  fontSize: 20,color: Colors.black
                ),),
                color: Colors.deepOrange,
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Text("Insart data successful",
                      style: TextStyle(fontSize: 20,color: Colors.black),),
                      action: SnackBarAction(label: "Ok",textColor: Colors.black, 
                      onPressed: (){
                        Navigator.pop(context);
                      }),
                      )
                      );
                 if(nameController.text.isNotEmpty && ageController.text.isNotEmpty && salaryController.text.isNotEmpty){
                  insertData(nameController.text, ageController.text, salaryController.text);
                 }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
                ),
                ),
        ],
      ),
    );
  }
  void insertData(var name, var age,var salary){
    databaseRef.child("path").push().set({
     "name" : name,
     "age" : age,
     "salary" : salary
    });
    nameController.clear();
    ageController.clear();
    salaryController.clear();
  }
}