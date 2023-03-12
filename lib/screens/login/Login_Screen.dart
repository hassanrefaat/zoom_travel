import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zoom_travel/layout/zoom_layout.dart';
import 'package:zoom_travel/screens/login/Reset_my_password.dart';

import '../../shared/components/components.dart';
import 'Signup_Screen.dart';

class ZoomLoginScreen extends StatelessWidget{
  @override
  var formKey = GlobalKey<FormState>();
  var emailControler= TextEditingController();
  var passwordControler= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:

      Padding(

        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(

            child: Form(
              key:formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const SizedBox(height: 90,),
                  Center(
                    child: Image.asset("assets/images/logo.png",
                    height: 200,
                    width: 200,
                    fit: BoxFit.fill,
                  ),
                  ),

                  const SizedBox(
                    height: 30.0,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: defaultFormField(
                      controller: emailControler,
                      type: TextInputType.emailAddress,
                      validator: ( value){
                        if(value!.isEmpty)
                        {
                          return'please enter your email address';
                        }else{}
                      },
                      lable: 'Email Address',
                      prefix: Icons.email_outlined,

                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(

                    controller: passwordControler,
                    type: TextInputType.visiblePassword,
                    //suffix:  ShopLoginCubit.get(context).suffix,
                    onSubmit:(value)
                    {
                      if(formKey.currentState!.validate())
                      {
                        // ShopLoginCubit.get(context).userLogin(
                        //   email: emailControler.text,
                        //   password: passwordControler.text,
                        //);
                      }
                    },
                   // isPassword:  ShopLoginCubit.get(context).isPassword,

                    suffixPressed:()
                    {
                     // ShopLoginCubit.get(context).changePasswordVisibility();
                    } ,
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return'password is to short';
                      }
                    },
                    lable: 'Password',
                    prefix: Icons.lock_outline,
                    suffix:Icons.visibility_off,
                  ),


                  // ConditionalBuilder(
                  //   condition: state is! ShopLoginLoadingState ,
                  //   builder:(context)=>defaultButton(
                  //     function: ()
                  //     {
                  //       if(formKey.currentState!.validate())
                  //       {
                  //         ShopLoginCubit.get(context).userLogin(
                  //           email: emailControler.text,
                  //           password: passwordControler.text,
                  //         );
                  //       }
                  //     },
                  //     text:'login',
                  //     isUpperCase: true,
                  //   ),
                  //   fallback:(context)=> const Center(child: CircularProgressIndicator()),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      defaultTextButton(function:(){
                        navigateTo(context, ResetMyPassword());
                      }, text:'Forget Password', )
                    ],
                  ),
                  Center(child: defaultButton(function: ()
                  {
                    navigateTo(context, ZoomLayout());
                  }, text: 'LOGIN')),
                  SizedBox(
                    height: 5.0,
                  ),
                  Center(child: Text('Or Continue with',
                  style:TextStyle(
                    fontSize: 16,
                    color: Colors.indigo
                  ) ,
                  )),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 25,
                          backgroundColor: Colors.white30,
                          child: IconButton(onPressed:(){},
                              icon:const Icon(FontAwesomeIcons.google,color: Colors.redAccent, ))),
                      CircleAvatar(
                        radius: 25,
                          backgroundColor: Colors.white30,
                          child: IconButton(onPressed:(){},
                              icon:const Icon(FontAwesomeIcons.twitter,color: Colors.lightBlue,))),
                      CircleAvatar(
                        radius: 25,
                          backgroundColor: Colors.white30,
                          child: IconButton(onPressed:(){},
                              icon:const Icon(FontAwesomeIcons.facebook,color: Colors.blue,))),



                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not a member ?',),
                      defaultTextButton(
                        function:()
                        {
                          navigateTo(context,ZoomRegisterScreen (),);

                        }
                        , text: 'Register Now',
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

}