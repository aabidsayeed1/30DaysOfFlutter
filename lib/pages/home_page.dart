// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Aabid";

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20,(index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App",style: TextStyle(
          color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context,index){
            return ItemWidget(
              item: dummyList[index],);
          },
        ),
      ),








    //   body: Center(
    //     // ignore: avoid_unnecessary_containers
    //     child: Container(
    //       child: Text("Welcome to $days days of flutter by $name or " + name),
    //     ),
    //   ),
    //   // ),
    // //  body: Container(
    // //     height: 100,
    // //     width: 100,
    // //     color: Colors.green,),
       
      drawer: MyDrawer(),
    );
  }
}
