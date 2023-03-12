import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_travel/screens/login/Login_Screen.dart';
import 'package:zoom_travel/shared/styles/icon_broken.dart';

import '../../shared/components/components.dart';

class ZoomRegisterScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailControler= TextEditingController();
    var passwordControler= TextEditingController();
    var repasswordControler=TextEditingController();
    var nameControler= TextEditingController();
    var phoneControler= TextEditingController();

    // TODO: implement build
    return Scaffold(
           body:
      Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text('Create Account',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.headline3
                          ,color: Colors.black
                    )

                    ),

                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  
                  defaultFormField(controller:nameControler ,
                      type: TextInputType.text,
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return'please enter your name';
                        }
                        return null;
                      },
                      lable: 'User name',
                      prefix: FontAwesomeIcons.user,
                  ),
                  const SizedBox(height: 15.0,),
              defaultFormField(controller:emailControler ,
                type: TextInputType.text,
                validator: (value){
                  if(value!.isEmpty)
                  {
                    return'please enter your E-mail';
                  }
                  return null;
                },
                lable: 'Email Address',
                prefix: Icons.email_outlined,
              ),
                  const SizedBox(
                    height: 15,
                  ),
                  defaultFormField(controller:phoneControler ,
                    type: TextInputType.phone,
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return'please enter your Phone Number';
                      }
                      return null;
                    },
                    lable: 'Phone',
                    prefix: Icons.email_outlined,
                  ),
                  const SizedBox(height: 15.0,),
                  defaultFormField(controller:passwordControler ,
                    type: TextInputType.visiblePassword,
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return'please enter your password';
                      }return null;
                    },
                    lable: 'Password',
                    prefix: IconBroken.Lock,
                    suffix: Icons.visibility_off_outlined
                  ),
                  const SizedBox(height: 15.0,),
                  defaultFormField(controller:repasswordControler ,
                    type: TextInputType.visiblePassword,
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return'please enter your Password';
                      }return null;
                    },
                    lable: 'Confirm Password',
                    prefix: IconBroken.Lock,
                      suffix: Icons.visibility_off_outlined

                  ),
                  const SizedBox(height: 5,),
                  const Text.rich(
                     TextSpan(
                       text: '             By Continuing , You Agree to Our,', // default text style
                       children: <TextSpan>[
                         TextSpan(text: 'Terms Of Service ',

                           style: TextStyle(color: Colors.blue),),

                       ],
                     ),
                   ),
                   const Text.rich(TextSpan(
                     text: '                                   and ',
                     children: <TextSpan>[
                       TextSpan(text: 'Privacy Police',style: TextStyle(color: Colors.blue)),

                     ]

                   )),
                   const SizedBox(
                     height: 10,
                   ),
                   Center(child:
                   defaultButton(function: (){}, text:'Login'))
                  ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? '),
                      defaultTextButton(function: (){
                        navigateTo(context, ZoomLoginScreen());
                      }, text: 'Login')
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}