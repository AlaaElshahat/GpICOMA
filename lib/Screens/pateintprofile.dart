import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:icoma/component/bottom_nav_bar.dart';
import 'package:icoma/component/rounded_app_bar.dart';
import 'package:icoma/constant.dart';
import 'package:icoma/models/get.dart';
import 'package:icoma/services/postService.dart';
import 'package:icoma/services/updateService.dart';
import 'package:image_picker/image_picker.dart';

class PateintProfile extends StatefulWidget {
  User user;
  PateintProfile(this.user);

  @override
  State<PateintProfile> createState() => _PateintProfileState();
}

class _PateintProfileState extends State<PateintProfile> {
  final ImagePicker _picker = ImagePicker();
     File? pickedImage;
  takePhoto() async {
    final XFile? image = await _picker.pickImage(source:ImageSource.camera);  
    final File? file = File(image!.path);                
    setState(() {
     pickedImage =file;
    });
    // final File? file = File(image!.path);
    // return file;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar:RoundAppBar(),
      body: Stack(
        children:[
             Padding(
               padding: const EdgeInsets.fromLTRB(35, 20, 35, 110),
                child: SizedBox(
                 height: double.infinity,
                  width: double.infinity,
                 child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(
                    color:  Color(0xFF707070),
                    width: 0.5,
                  ),
                    ),
                    borderOnForeground: true,
                    color:  Colors.white ,
                    elevation: 10,
                    shadowColor: const Color(0xFF707070),
                      child: ListView(
                        children:[ Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                   children: <Widget>[
                                     
                                     Padding(
                                       padding: const EdgeInsets.fromLTRB(8, 0, 8, 5),
                                       child: SizedBox(
                                         height: 100,
      width: 100,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
           CircleAvatar(
            backgroundImage: pickedImage == null? const AssetImage("assets/images/pateintimage.png"): FileImage(pickedImage!) as ImageProvider ,
          ),
          Positioned(
              bottom: 0,
              right: -25,
              child: RawMaterialButton(
                onPressed: () {
                     takePhoto();
                },
                elevation: 2.0,
                fillColor:const  Color(0xFFF5F6F9),
                child: Icon(Icons.camera_alt_outlined, color: Colors.blue[900],),
                padding:const EdgeInsets.all(15.0),
                shape:  const CircleBorder(),
              )),
        ],
      ),
                                       ),
                                     ), 
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(2, 1.5, 2, 2),
                                      child: Center(child: Text(widget.user.name.toString(), style: const TextStyle(color: kTextColor,fontSize: 20 ,fontWeight:FontWeight.w600))),
                                    ),
                                     Center(child: Padding(
                                       padding: const EdgeInsets.fromLTRB(8, 1.5, 8, 0),
                                       child: Text("ID : "+widget.user.id.toString(), style: const TextStyle(color: kTextColor,fontSize: 20 ,fontWeight:FontWeight.w500)),
                                     )), 
                                   Container(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      child: Column(children: [
                                        
                                      ],),
                                    ),
                                  
                              ],
                            
                          ),
                        ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(6, 4, 6, 6),
                            child: Text("Identity : "+widget.user.identity.toString(), style: const TextStyle(color: kTextColor,fontSize: 16 ,fontWeight:FontWeight.w500)),
                          ),
                                        Padding(
                                          padding: const EdgeInsets.all(6),
                                          child: Text("Blood Type : "+widget.user.bloodType.toString(), style: const TextStyle(color: kTextColor,fontSize: 16 ,fontWeight:FontWeight.w500)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(6),
                                          child: Text("Medicine : "+widget.user.medicines.toString(), style: const TextStyle(color: kTextColor,fontSize: 16 ,fontWeight:FontWeight.w500)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(6),
                                          child: Text("Allergies : "+widget.user.allergies.toString(), style: const TextStyle(color: kTextColor,fontSize: 16 ,fontWeight:FontWeight.w500)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(6),
                                          child: Text("test Result : "+widget.user.testResult.toString(), style: const TextStyle(color: kTextColor,fontSize: 16 ,fontWeight:FontWeight.w500)),
                                        ),
                                         Padding(
                                          padding: const EdgeInsets.all(6),
                                          child: Text("created at : "+widget.user.createdAt.toString(), style: const TextStyle(color: kTextColor,fontSize: 16 ,fontWeight:FontWeight.w500)),
                                        ),
                                    
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(8, 8,8, 0),
                                          child: Row(
                                            children: [
                                             const Spacer(),
                                             Padding(
                                               padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                               child: OutlinedButton(onPressed: (){
                         if(pickedImage!=null)                      
                    { UpdatePatient(pickedImage,widget.user).updatePateintProfile(widget.user.id.toString());}
                                               }, child: const Text("update",style: TextStyle(color: kTextColor,fontSize: 16,fontWeight: FontWeight.w500)),
                                               style: OutlinedButton.styleFrom(
                                                    side: const BorderSide(color:kPrimaryColor , width: 1),
                                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                          )),
                                             )

                                            ],
                                          ),
                                        )
        ]),
                  ),
               ),
             ),
          
           const MyBottomNavBar()
          ]
      ),
    );
  }
}

class UpdatedProfile extends StatefulWidget {
  User user;
  UpdatedProfile(this.user);

  @override
  State<UpdatedProfile> createState() => _UpdatedProfileState();
}

class _UpdatedProfileState extends State<UpdatedProfile> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar:RoundAppBar(),
      body: Stack(
        children:[
             Padding(
               padding: const EdgeInsets.fromLTRB(35, 20, 35, 110),
               child: SizedBox(
                 height: double.infinity,
                 width: double.infinity,
                 child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(
                    color:  Color(0xFF707070),
                    width: 0.5,
                  ),
                    ),
                    borderOnForeground: true,
                    color:  Colors.white ,
                    elevation: 10,
                    shadowColor: const Color(0xFF707070),
                      child: ListView(
                        children:[
                       
        ]),
                  ),
               ),
             ),
          
           const MyBottomNavBar()
          ]
      ),
    );
  }
}