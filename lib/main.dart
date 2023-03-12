import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_travel/screens/login/Create_New_Password.dart';
import 'package:zoom_travel/screens/login/Login_Screen.dart';
import 'package:zoom_travel/screens/login/Reset_my_password.dart';
import 'package:zoom_travel/screens/login/Signup_Screen.dart';
import 'package:zoom_travel/screens/login/first.dart';
import 'package:zoom_travel/screens/onboarding/onboarding.dart';
import 'package:zoom_travel/shared/bloc_observer.dart';
import 'package:zoom_travel/shared/cubit/cubit.dart';
import 'package:zoom_travel/shared/cubit/states.dart';
import 'package:zoom_travel/shared/network/local/cache_helper.dart';

import 'layout/zoom_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers:
        [
          BlocProvider(create:(BuildContext context)=>ZoomCubit()

          )
        ],
        child:BlocConsumer<ZoomCubit,ZoomStates>(
          listener:(context,state){} ,
          builder: (context,state)
          {
            return MaterialApp(
              themeMode: ThemeMode.light,
              home: OnBoardingScreen(),
            );
          },
        )
    );
  }
}




