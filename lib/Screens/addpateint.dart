import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icoma/Screens/pateintInfo.dart';
import 'package:icoma/component/bottom_nav_bar.dart';
import 'package:icoma/component/pateintcard.dart';
import 'package:icoma/component/rounded_app_bar.dart';
import 'package:icoma/constant.dart';
import 'package:icoma/models/get.dart';
import 'package:icoma/services/getService.dart';

class AddPateint extends StatefulWidget {
  const AddPateint({ Key? key }) : super(key: key);

  @override
  State<AddPateint> createState() => _AddPateintState();
}

class _AddPateintState extends State<AddPateint> {
   bool loading = true;
  List<User> users = [];

  getUserList() async {
    users = await UserService().getPateints();
    loading = false;
    setState(() {
      
    });
  }

  @override
  void initState() {
    super.initState();
    getUserList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:kBackgroundColor ,
      appBar: RoundAppBar(),
      
      body:Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
            child: SizedBox(
              width:double.infinity,
              height: double.infinity,
             child: Center(
                child: Scaffold(
                 backgroundColor:kBackgroundColor ,
                  body:
                  loading
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                  physics:  const ScrollPhysics(),
                   padding: const EdgeInsets.fromLTRB(40, 50, 40, 20),
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(0),
                        child:PateintCard(user: users[index],)
                      );
                    }, gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                    ),
                  ),
                ),
             ),
           ),
          ),
          Column(
            children:[
              Spacer(),
         Row(
           children :[
             Spacer(),
             Padding(
               padding: const EdgeInsets.fromLTRB(0, 0,30, 105),
              child: FloatingActionButton(
        onPressed: (){
                Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const PateintInfo( )),
                   );
        },

        child: SvgPicture.asset("assets/icons/addicon.svg"),
        
      ),
             ),
           ]
         ),]),
           
          
          const MyBottomNavBar()
        ],
      ),
    );
  }
}