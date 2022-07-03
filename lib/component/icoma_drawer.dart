import 'package:flutter/material.dart';

import '../constant.dart';

class IcomaDrawer extends StatelessWidget {
  const IcomaDrawer({ Key? key }) : super(key: key);

  Widget buildDrawerHeader(context) {
    return Column(
      children: [
        //SizedBox(height: ,),
        Container(
          padding: const EdgeInsets.all(50),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
           color: Colors.blue[100],
          ),
          child: Image.asset(
            "assets/images/doctor.png",
            // fit: BoxFit.cover,
          ),
        ),
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(16.0),
        //   child: Image.asset(
        //     'assets/images/img.png',
        //   ),
        // ),
        const Text(
          'Name',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Jop title',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget buildDrawerListItem(
      {required IconData leadingIcon,
      required String title,
      Widget? trailing,
      Function()? onTap,
      Color? color}) {
    return Container(
      height: 50,
      width: 60,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          leadingIcon,
          color: Colors.white,
        ),
        title: Text(title,style: TextStyle(color: Colors.white),),
        trailing: trailing ??= const Icon(
          Icons.double_arrow_outlined,
          color: Colors.white,
        ),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
              padding: EdgeInsets.all(20 ),
              children: [
                Container(
                  height: 210,
                  child: DrawerHeader(
                    //decoration: const BoxDecoration(color: Colors.white),
                    child: buildDrawerHeader(context),
                  ),
                ),
                buildDrawerListItem(
                    leadingIcon: Icons.edit_rounded, title: 'My Profile'),
                const SizedBox(
                  height: 10,
                ),
                buildDrawerListItem(leadingIcon: Icons.help, title: 'Help US'),
                const SizedBox(
                  height: 20,
                ),
                buildDrawerListItem(leadingIcon: Icons.info, title: 'Information'),
                const SizedBox(
                  height: 20,
                ),
                buildDrawerListItem(
                    leadingIcon: Icons.privacy_tip_outlined, title: 'Privacy'),
                const SizedBox(
                  height: 20,
                ),
                buildDrawerListItem(
                    leadingIcon: Icons.settings_outlined, title: 'Setting'),
                const SizedBox(
                  height: 60,
                ),
                buildDrawerListItem(leadingIcon: Icons.logout, title: 'Log Out')
              ],
            ),
      
    );
  }
}