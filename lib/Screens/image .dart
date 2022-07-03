// import 'dart:ffi';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class IcomaImage extends StatefulWidget {
  const IcomaImage({ Key? key }) : super(key: key);

  @override
  State<IcomaImage> createState() => _IcomaImageState();
}

class _IcomaImageState extends State<IcomaImage> {
  
   final ImagePicker _picker = ImagePicker();
     File? pickedImage;
   takePhoto(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source:source);  
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
      appBar: AppBar(
        title: Text("Flutter Image Picker Example -codeplayon"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Image Picker Example in Flutter -codeplayon",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              child: Center(
                child: pickedImage == null? Text("No Image is picked"): Image.file(pickedImage!),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                onPressed: ()
                {
                  takePhoto( ImageSource.camera);
                },
                tooltip: "Pick Image form gallery",
                child: Icon(Icons.add_a_photo),
              ),
              FloatingActionButton(
                onPressed:(){},
                tooltip: "Pick Image from camera",
                child: Icon(Icons.camera_alt),
              )
            ],
          )
        ],
      ),
    );
  }
}