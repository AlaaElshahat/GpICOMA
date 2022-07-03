import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icoma/Screens/addpateint.dart';
import 'package:icoma/Screens/doctorInstruction.dart';
import 'package:icoma/Screens/pateintInfo.dart';
import '../constant.dart';

// ignore: must_be_immutable
class HomeCard extends StatelessWidget {
  String ?homeIcon;
  String ?text;
 HomeCard(this.homeIcon,this.text, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
    child: GestureDetector(
      onTap: (){
        if(text=='instruction'){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder:  (context) => const DoctorInstruction())
                 );
                }
                else if(text=='Pateints')
                {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const AddPateint ( )),
                 );
                }
        else
        {
          Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const PateintInfo( )),
                 );
        }
      },
      child: SizedBox(
        height: 136,
        width:156,
        child: Card(
          
          margin: const EdgeInsets.fromLTRB(25,10 , 10, 10),
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
            child: Container(
              constraints: const BoxConstraints(
     maxHeight: double.infinity,
),
              child: Center(
                child: Column(
                      mainAxisSize: MainAxisSize.min,
                       children: <Widget>[
                         Padding(padding: const EdgeInsets.all(8),
                        child:text=='instruction'?  Image.asset(homeIcon!):SvgPicture.asset(homeIcon!)),
                         Center(child: Text(text!, style: const TextStyle(color: kTextColor,fontWeight:FontWeight.bold,fontSize: 14 ))),
                  ],
                ),
              ),
            ),
        ),
      ),
    )
    );
    
    
  }
}

