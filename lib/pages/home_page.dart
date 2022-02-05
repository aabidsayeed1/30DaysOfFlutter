// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';
import 'dart:convert';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Aabid";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData()async{
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await  rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    
    CatalogModel.items = List.from(productsData)
    .map<Item> ((item) => Item.fromMap(item))
    .toList();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(5,(index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App",style: TextStyle(
          color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
        ? 
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16),
           itemBuilder: (context,index){
             final item = CatalogModel.items[index];
             return Card(
               clipBehavior :Clip.antiAlias,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10)),
               child: GridTile(
                 header: Container(child: Text(item.name,style: TextStyle(color: Colors.white),),
                 padding: const EdgeInsets.all(12),
                 decoration: BoxDecoration(
                   color: Colors.deepPurple,

                 ),),
                 child: Image.network(item.image),
                 footer: Text(item.price.toString()),));
           },
           itemCount: CatalogModel.items.length,
        // ListView.builder(
        //   itemCount: CatalogModel.items.length,
        //   itemBuilder: (context,index) => 
        //    ItemWidget(
        //       item: CatalogModel.items[index],
        //       ),
        
        ):
        Center(child: CircularProgressIndicator(),)
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
