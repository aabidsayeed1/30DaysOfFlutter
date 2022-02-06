// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';
import 'package:flutter_application_1/widgets/themes.dart';
//  ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';


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


      // appBar: AppBar(
      //   title: Text("Catalog App",style: TextStyle(
      //     color: Colors.black),),
      // ),




      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             CatalogHeader(),
             if(CatalogModel.items!= null && CatalogModel.items.isNotEmpty)
             CatalogList().expand()
             else
             Center(child: CircularProgressIndicator(),
             )
            ],
          ),
        ),
      )
      
      
      
      
      
      
      
      
      
      
      // Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: (CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
      //   ? 
      //     GridView.builder(
      //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 2,
      //         mainAxisSpacing: 16,
      //         crossAxisSpacing: 16),
      //      itemBuilder: (context,index){
      //        final item = CatalogModel.items[index];
      //        return Card(
      //          clipBehavior :Clip.antiAlias,
      //          shape: RoundedRectangleBorder(
      //            borderRadius: BorderRadius.circular(10)),
      //          child: GridTile(
      //            header: Container(child: Text(item.name,style: TextStyle(color: Colors.white),),
      //            padding: const EdgeInsets.all(12),
      //            decoration: BoxDecoration(
      //              color: Colors.deepPurple,

      //            ),),
      //            child: Image.network(item.image),
      //            footer: Container(
      //              child: Text(
      //                item.price.toString(),
      //                style: TextStyle(color: Colors.white),
      //                ),
      //                padding: const EdgeInsets.all(12),
      //                decoration: BoxDecoration(
      //                  color:Colors.black,
      //                   ),),));
      //      },
      //      itemCount: CatalogModel.items.length,
      //   // ListView.builder(
      //   //   itemCount: CatalogModel.items.length,
      //   //   itemBuilder: (context,index) => 
      //   //    ItemWidget(
      //   //       item: CatalogModel.items[index],
      //   //       ),
        
      //   ):
      //   Center(child: CircularProgressIndicator(),)
      // ),








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
       
      // drawer: MyDrawer(),
    );
  }
}
class CatalogHeader  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending Products".text.xl2.make(),
      ],
      
    );
  }
}
class CatalogList extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    shrinkWrap: true,
    itemCount: CatalogModel.items.length ,
    itemBuilder: (context,index){
      final catalog = CatalogModel.items[index];
      return CatalogItem(catalog: catalog);
    },
      
    );
  }
}
class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key,required this.catalog}) 
  // ignore: unnecessary_null_comparison
  :assert(catalog != null),
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
            CatalogImage(
         image: catalog.image
         ),
         Expanded(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment:MainAxisAlignment.center,
             children: [
               catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
               catalog.desc.text.make(),
               10.heightBox,
               ButtonBar(
                 alignment: MainAxisAlignment.spaceBetween,
                 buttonPadding: EdgeInsets.zero,
                 children: [
                   "\$${catalog.price}".text.bold.xl.make(),
                   ElevatedButton(
                     onPressed:(){},
                     style: ButtonStyle(
                       backgroundColor:
                       MaterialStateProperty.all(
                         MyTheme.darkBluishColor,
                         ),
                         shape: MaterialStateProperty.all(StadiumBorder())
                     ),
                   child: "Buy".text.make(),)
                 ],
               ).pOnly(right: 8.0)
               
             ],
           )
         )
      ],
      ),
    ).white.roundedLg.square(150).make().py16();
  }
}
class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Image.network(
          image
          ).box.roundedLg.p8.color(MyTheme.creamColor).make().p16().w40(context,);

  }
}
