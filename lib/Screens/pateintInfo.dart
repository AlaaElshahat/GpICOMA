// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter_svg/svg.dart';
import 'package:icoma/component/bottom_nav_bar.dart';
import 'package:icoma/services/getService.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:icoma/component/rounded_app_bar.dart';
import 'package:icoma/constant.dart';
import 'package:icoma/services/postService.dart';
import 'HomePage.dart';
import 'addpateint.dart';


class PateintInfo extends StatefulWidget {
  const PateintInfo({ Key? key }) : super(key: key);

  @override
  State<PateintInfo> createState() => _PateintInfoState();
}

class _PateintInfoState extends State<PateintInfo> {
  final ImagePicker _picker = ImagePicker();
     File? pickedImage;
   takePhoto(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source:source);  
    final File? file = File(image!.path);                
    setState(() {
     pickedImage =file;
    });
 }
  var fullName =TextEditingController();
   var age =TextEditingController();
  //  var bloodType =TextEditingController();
  var bloodType ="O+";
  var geneticHistory =TextEditingController();
  var phoneNumber =TextEditingController();
   var medicine=TextEditingController();
    var identity=TextEditingController();
     var allergies=TextEditingController();
     var testResult=TextEditingController();
     var bloodTypes = [   
    "A+","A-","B+","B-","O+","O-","AB+","AB-"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: RoundAppBar(),
      body: Stack(
        children: [
          Container(
            color: kBackgroundColor,
                child: ListView(children: [
                  Padding(
                   padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: SizedBox(
                  
                      height:25,
                      width: 25,
                      child: CircleAvatar(
            backgroundColor: kBackgroundColor,
            radius: 100,
            child: SizedBox(
              height: 50,
              width: 50,
               child: pickedImage == null? const Text(""): Image.file(pickedImage!)),
          ),
                    ), 
                  ),
                  Padding(
                   padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: TextField(
                      controller: fullName,
                      decoration: const InputDecoration(
                        hintText: 'Full Name',
                    
                        hintStyle:  TextStyle(
                            color: kTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        enabledBorder: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 10, 0),
                          child: TextField(
                             controller: age,
                            decoration: const InputDecoration(
                              hintText: 'Age',
                              hintStyle: TextStyle(
                                  color: kTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              enabledBorder: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                      
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20 ,30, 0),
                          child: TextField(
                             controller: identity,
                            decoration: const InputDecoration(
                              hintText: 'Identity',
                              hintStyle:  TextStyle(
                                  color: kTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              enabledBorder: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 10, 0),
                          child: TextField(
                             controller: phoneNumber,
                            decoration: const InputDecoration(
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(
                                  color: kTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              enabledBorder: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                      
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 37, 30, 0),
                          child: DropdownButton(
                          hint: Text("lll"),
                         underline: Container(
    height: 1.5,
    color: Colors.black54, //<-- SEE HERE
  ),
  isExpanded: true,
  borderRadius:BorderRadius.circular(30),
               style: const TextStyle(
                color: kTextColor,
                                  fontSize: 16,
                                  // fontWeight: FontWeight.w500), items: [],
                              //enabledBorder: const UnderlineInputBorder(),
               ),
              // Initial Value
              value: bloodType,
               
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),   
             
               
              // Array list of items
              items: bloodTypes.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  bloodType = newValue!;
                });
              },
            ),
                          // TextField(
                          //    controller: bloodType,
                          //   decoration: const InputDecoration(
                          //     hintText: 'Blood Type',
                          //     hintStyle:  TextStyle(
                          //         color: kTextColor,
                          //         fontSize: 16,
                          //         fontWeight: FontWeight.w500),
                          //     enabledBorder: UnderlineInputBorder(),
                          //   ),
                          // ),
                        ),
                      ),
                    ],
                  ),
                   Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: TextField(
                       controller: geneticHistory,
                      decoration: const InputDecoration(
                        hintText: 'Genetic History Of The Disease',
                        hintStyle:  TextStyle(
                            color: kTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        enabledBorder: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: TextField(
                       controller: medicine,
                      decoration: InputDecoration(
                        hintText: 'Medicine',
                        hintStyle: new TextStyle(
                            color: kTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        enabledBorder: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: TextField(
                       controller: allergies,
                      decoration: InputDecoration(
                        hintText: 'Allergies',
                        hintStyle: new TextStyle(
                            color: kTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        enabledBorder: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                    child: Row(
                      children: [
                        ElevatedButton.icon(onPressed: (){
                           takePhoto( ImageSource.camera);
                        }, 
                        icon:  const Icon(Icons.camera_alt,color: kPrimaryColor,),
                       
                       label:const Text('Capture Photo',
                        style: TextStyle(color: kTextColor),),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)
                          )
                          )
                          )
                        ),
                        const Spacer(),
                        ElevatedButton.icon(onPressed:(){ 
                           takePhoto( ImageSource.gallery);
                        }
                        
                        , icon: const Icon(Icons.upload,color: kPrimaryColor), label: const Text('upload Photo',
                        style: TextStyle(color: kTextColor),),

                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)
                          )
                          )
                          )
                        )
                           ],
                     ),
                  )
                  ,
                 Center(
                   child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 13, 20, 10),
                     child: SizedBox(
                       width: 110,
                       child: TextButton(onPressed: (){
                          PostPateint(fullName:fullName.text, age:age.text, geneticHistory:geneticHistory.text, phoneNumber:phoneNumber.text,allergies: allergies.text,bloodType: bloodType,medicine: medicine.text,testResult: testResult.text,identity: identity.text
                          ,image: pickedImage
                          ).postPateintInfo();
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>Home(),));
                       }, child: const Text('Save'),
                       style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)
                        ) ,
                        primary:kBackgroundColor,
                        backgroundColor:  kPrimaryColor
                       ),
),
                     ),
                   ),
                 )
           
                ]),
              ),
        ],
      ),
    );
  }
}
