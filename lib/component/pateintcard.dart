import 'package:flutter/material.dart';
import 'package:icoma/Screens/addpateint.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:icoma/Screens/pateintprofile.dart';
import 'package:icoma/models/get.dart';
import 'package:icoma/services/deleteService.dart';
import '../constant.dart';

// ignore: must_be_immutable
class PateintCard extends StatefulWidget {
  User user;
  PateintCard({Key? key, required this.user}) : super(key: key);
  @override
  State<PateintCard> createState() => _PateintCardState();
}

class _PateintCardState extends State<PateintCard> {

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
    child: GestureDetector(
      onTap: (){
        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PateintProfile (widget.user,)),
                 );
      },
      child: SizedBox(
        height: 152,
        width:157,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
            side: const BorderSide(
          color:  Color(0xFF707070),
          width: 0.35,
        ),
          ),
          borderOnForeground: true,
          color:  Colors.white ,
          elevation: 30,
          shadowColor: const Color(0xFF707070),
            child: Container(
              constraints: const BoxConstraints(
     maxHeight: double.infinity,
),
              child: Center(
                child: Column(
                      mainAxisSize: MainAxisSize.min,
                       children: <Widget>[
                         Padding(padding: const EdgeInsets.all(20),
                       
                        child:SizedBox(
                          width: 69,
                          height: 69,
                        child:  Container(
                   child: widget.user.pImg==null ? Image.asset("assets/images/pateintimage.png"):Image.network(widget.user.image.toString()),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green
                ),)
      
                        ),
                        
                        ),
                        
                        Center(child: Text(widget.user.name.toString(), style: const TextStyle(color: kTextColor,fontSize: 16 ,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold))),
                         Center(child: Text(widget.user.age.toString()+" age", style: const TextStyle(color: kTextColor,fontWeight:FontWeight.bold,fontStyle: FontStyle.italic )),) ,
                  ],
                ),
              ),
            ),
        ),
      ),
      onLongPress: () {
      showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: const Text('welcome'),
    content: Text("Delete Pateint ("+widget.user.name.toString()+") "),
    actions: [
      ElevatedButton(
          onPressed: () {
          DeletePateint().deletePateint(widget.user.id.toString());
           Navigator.of(context).pop();
           Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddPateint()
                 ));
          },
          child: const Text('Delete'))
    ],
  ),
);
      },
    )
    );
    
  }
}