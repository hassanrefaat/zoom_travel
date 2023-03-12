import 'package:flutter/material.dart';
import 'package:zoom_travel/shared/components/components.dart';

var passwordController =TextEditingController();
var ConfirmpasswordController =TextEditingController();

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text('Create New Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),),
                SizedBox(height: 10,),
                Center(
                  child: Column(
                    children: [
                      Text('Your new password must be different '),
                      Text('from previous used passwords '),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                defaultFormField(
                    controller:passwordController ,
                    type: TextInputType.visiblePassword,
                    validator:(value){
                      if(value!.isEmpty)
                      {
                        return'please enter your password';
                      }
                      return null;
                    } ,
                    lable:'Password' ,
                    prefix:Icons.lock_outline,

                ),
                SizedBox(
                  height: 10,
                ),
                defaultFormField(
                  controller:passwordController ,
                  type: TextInputType.visiblePassword,
                  validator:(value){
                    if(value!.isEmpty)
                    {
                      return'please enter your password';
                    }
                    return null;
                  } ,
                  lable:'Confirm Password' ,
                  prefix:Icons.lock_outline,
                  //suffix:
                ),
                SizedBox(
                  height: 20,
                ),
                defaultButton(function: (){}, text: 'Reset Password')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
