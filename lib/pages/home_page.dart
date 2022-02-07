// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/themes.dart';
//  ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

import '../utills/routes.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';


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
     backgroundColor: MyTheme.creamColor,
     floatingActionButton: FloatingActionButton(
       onPressed: () => Navigator.pushNamed(context, MyRoutes.CartRoute),
     backgroundColor: MyTheme.darkBluishColor,
     child: Icon(CupertinoIcons.cart)),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             CatalogHeader(),
             if(CatalogModel.items!= null && CatalogModel.items.isNotEmpty)
             CatalogList().py16().expand()
             else
             CircularProgressIndicator().centered().expand(),
             
            ],
          ),
        ),
      )  
     
    );
  }
}