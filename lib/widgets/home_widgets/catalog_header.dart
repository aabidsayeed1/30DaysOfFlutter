import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/themes.dart';


// ignore: use_key_in_widget_constructors
class CatalogHeader  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: deprecated_member_use
        "Catalog App".text.xl5.bold.color(context.theme.accentColor).make(),
        "Trending Products".text.xl2.make(),
      ],
      
    );
  }
}