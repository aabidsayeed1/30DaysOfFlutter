import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';


class HomeDetailPage extends StatelessWidget {
final Item catalog;

  const HomeDetailPage({Key? key,required this.catalog}) 
  // ignore: unnecessary_null_comparison
  :assert(catalog != null),
   super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: 
      Container(
        color: Colors.white,
        child: ButtonBar( alignment: MainAxisAlignment.spaceBetween,
                   buttonPadding: EdgeInsets.zero,
                   children: [
                     "\$${catalog.price}".text.bold.xl4.red800.make(),
                     ElevatedButton(
                       onPressed:(){},
                       style: ButtonStyle(
                         backgroundColor:
                         MaterialStateProperty.all(
                           MyTheme.darkBluishColor,
                           ),
                           shape: MaterialStateProperty.all(StadiumBorder())
                       ),
                     child: "Add to cart".text.make(),
                     ).wh(120, 50)
                   ],
                 ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
              ).h32(context),
              Expanded(
                child: 
              VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge:VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.color(MyTheme.darkBluishColor).bold.make(),
               catalog.desc.text.xl.make(),
               "In the first phase, we initiate the counter i to zero. This phase is done only once. Next comes the condition i < 10. If the condition is met, the statement inside the for block is executed. In the third phase the counter is increased. Now we repeat the 2, 3 phases until the condition is not met and the for loop is left. In our case, when the counter i is equal to 10, the for loop stops executing."
               .text.xs.make().p8(),
               10.heightBox,
                    ],
                  ).py64(),),
              ))
          ],
        ).p16(),
      ),
    );
  }
}