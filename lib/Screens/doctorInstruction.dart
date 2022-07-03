import 'package:flutter/material.dart';
import 'package:icoma/component/bottom_nav_bar.dart';
import 'package:icoma/component/rounded_app_bar.dart';
import 'package:icoma/constant.dart';

class DoctorInstruction extends StatelessWidget {
  const DoctorInstruction({ Key? key }) : super(key: key);

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
                      child: Column(
                         mainAxisSize: MainAxisSize.min,
                                   children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(30.0),
                                      child: Center(child: Text("Instruction",style: TextStyle(color: kTextColor,fontSize: 22,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:  Text(
                                        " Need to equip yourself with an indirect ophthalmoscope that stitable for mobile phone models",
                                        style: TextStyle(color: kTextColor,fontSize: 18,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:  const Text(
                                        " Pay attention to controlling exposure during shooting , overexposure or underexposure  may result in a poor quality image .",
                                        style: TextStyle(color: kTextColor,fontSize: 18,fontWeight: FontWeight.w500,fontStyle:FontStyle.italic)
                                      ),
                                    ),
                                               Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:  const Text(
                                        "The shooting process requires a dark environment ",
                                        style: TextStyle(color: kTextColor,fontSize: 18,fontWeight: FontWeight.w500,fontStyle:FontStyle.italic)
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:  const Text(
                                        " The obtained funds image cannot be distorted or deformed too much , since the resulting shape change of optic disc  .",
                                        style: TextStyle(color: kTextColor,fontSize: 18,fontWeight: FontWeight.w500,fontStyle:FontStyle.italic)
                                      ),
                                    )
                                   ]
                      ),
                  ),
               ),
             ),
          
           const MyBottomNavBar()
          ]
      ),
    );
  }
}