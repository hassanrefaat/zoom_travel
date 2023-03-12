import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_travel/shared/components/components.dart';

class Check_Screen extends StatelessWidget {
  const Check_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children:   [

                  Center(
                    child: Text('Check your Email',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(
                   height: 10,
                 ),
                 Center(
                   child: Image.asset("assets/images/Vector.png",
                     height: 100,
                     width: 100,
                     fit: BoxFit.fill,
                   ),
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Center(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [

                       Text('Enter your email address ',),
                       Text('associated with your account' ),
                     ],
                   ),
                 ),
                 SizedBox(
                   height: 100,
                 ),
                 defaultButton(function: (){}, text: 'Go Back'),
               ],

             ),
           ),
         ),
       ),

    );
  }
}
