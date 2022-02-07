// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors

          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}
class _CartTotal extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         // ignore: deprecated_member_use
         "\$9999".text.xl5.color(Colors.deepPurple).make(), 
         30.widthBox,
         ElevatedButton(
           onPressed: (){
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
               content:"Buying not supported yet".text.make(),
               ));
           },
           style: ButtonStyle(
             backgroundColor: MaterialStateProperty.all(context.theme.buttonColor)
           ),
           child: "Buy".text.color(Colors.white).make(),
           ).w32(context)
        ],
      ),
      
    );
  }
}
class _CartList extends StatefulWidget {
  const _CartList({ Key? key }) : super(key: key);

  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context,index) =>ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: (){

          },
          ),
          title: "Item 1".text.make(),
      ),
      
      
    );
  }
}
