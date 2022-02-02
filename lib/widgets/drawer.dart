// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class  MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final imageUrl = "https://pbs.twimg.com/media/EgQlDa5UMAAy_zq?format=jpg";


    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                //decoration: BoxDecoration(
                //  color: Colors.red
               // ),
                accountName: Text("Abid Bin Syeed"),
                accountEmail: Text("Sayeedaabid1@gmail.com"),
                //currentAccountPicture: Image.network(imageUrl) ,
                currentAccountPicture : CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),)
                )
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
                ),
                title: Text("Home",
                textScaleFactor: 1.2,
                style:TextStyle(
                  color:Colors.white)
                  ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled,
              color: Colors.white,),
              title: Text("Profile",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white),
                ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text("Email me",
              textScaleFactor: 1.2,
              style:TextStyle
              (color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}