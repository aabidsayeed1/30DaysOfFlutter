import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_detail_page.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../../widgets/themes.dart';
import 'catalog_image.dart';


// ignore: use_key_in_widget_constructors
class CatalogList extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    shrinkWrap: true,
    itemCount: CatalogModel.items.length ,
    itemBuilder: (context,index){
      final catalog = CatalogModel.items[index];
      return InkWell(
         onTap: () => Navigator.push(context,MaterialPageRoute(
           builder: (context)=>HomeDetailPage(
             catalog: catalog,
             ),
             ),
            ),
        child: CatalogItem(catalog: catalog),
        );
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
            Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(
                     image: catalog.image
                     ),
            ),
         Expanded(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment:MainAxisAlignment.center,
             children: [
               catalog.name.text.lg.color(context.accentColor).bold.make(),
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
                         // ignore: deprecated_member_use
                         context.theme.buttonColor,
                         ),
                         shape: MaterialStateProperty.all(StadiumBorder())
                     ),
                   child: "Add to cart".text.make(),)
                 ],
               ).pOnly(right: 8.0)
               
             ],
           )
         )
      ],
      ),
    ).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}