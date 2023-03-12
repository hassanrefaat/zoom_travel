import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_travel/screens/login/check.dart';
import 'package:zoom_travel/shared/components/components.dart';

class ResetMyPassword extends StatelessWidget{
  @override
  var emailControler= TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100,),
                Text('Reset Password ',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: 15,),
                Center(
                  child: Column(
                    children: [
                      Text('Enter your email address ',),
                      Text('associated with your account'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                defaultFormField(
                    controller: emailControler,
                    type: TextInputType.text,
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return'please enter your email address';
                      }else{}

                    },
                    lable: 'Email Address',
                    prefix: Icons.email_outlined
                ),
                SizedBox(height: 20,),
                defaultButton(
                    function: (){
                  navigateTo(context,Check_Screen() );
                }, text: 'Sent Email')

              ],
            ),
          ),
        ),
      ),
    );
  }

}