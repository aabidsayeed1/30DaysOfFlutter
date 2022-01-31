// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utills/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

   String name= "";
   bool changeButton =false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png", 
                fit: BoxFit.cover),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                  decoration: InputDecoration(
                     hintText: "Enter Username",
                     labelText: "Username"
                     ),
                     onChanged: (value){
                       name =value;
                       setState(() {});
                     },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Password"
                    ),
                ),
                SizedBox(
                  height: 40.0,
                ),


                InkWell(
                  onTap: ()async{
                    setState(() {
                      changeButton = true;
                    });
                    await Future.delayed(Duration(seconds: 1));
                   Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    alignment: Alignment.center,
                    width: changeButton ? 50 : 150,
                    height: 50,
                    //color: Colors.deepPurple,
                    child: changeButton 
                         ? Icon(
                           Icons.done,
                            color: Colors.white,)
                            :Text(
                      "Login",
                      style: TextStyle(
                        color :Colors.white, fontWeight :FontWeight.bold,fontSize: 18),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      // shape: changeButton ? BoxShape.circle : BoxShape.rectangle,
                      borderRadius: 
                           BorderRadius.circular(changeButton ? 50 : 10),
                    ),
                
                  ),
                ),
                // ElevatedButton(
                //   child: Text("Login"),
                //   style:TextButton.styleFrom(minimumSize: Size(120,40)),
                //   onPressed: (){
                //      Navigator.pushNamed(context, MyRoutes.homeRoute);
                //   },
                //    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
