import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_travel/shared/cubit/cubit.dart';
import 'package:zoom_travel/shared/cubit/states.dart';
import 'package:zoom_travel/shared/styles/color.dart';

import '../shared/styles/icon_broken.dart';

class ZoomLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ZoomCubit,ZoomStates>
      (
      listener:(context,states){} ,
        builder:(context,states){
       var cubit =ZoomCubit.get(context);
          return Scaffold(
            // appBar:AppBar(
            //   title: Text(cubit.titles[cubit.currentindex]),
            // ),
            body:cubit.BottomScreens[cubit.currentindex] ,
            bottomNavigationBar:BottomNavigationBar(
              onTap: (index){
                cubit.changeBottomScreen(index);

              },
              currentIndex: cubit.currentindex,
              items: [
                BottomNavigationBarItem(icon:Icon(IconBroken.Home,
                color: defaultColor,),
                label: 'Home',
                ),
                BottomNavigationBarItem(icon:Icon(IconBroken.Discovery,
                  color: defaultColor,),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(icon:Icon(IconBroken.Heart,
                  color: defaultColor,),
                  label: 'Favourite',
                ),
                BottomNavigationBarItem(icon:Icon(IconBroken.Location,
                  color: defaultColor,),
                  label: 'Trips',
                ),

                BottomNavigationBarItem(icon:Icon(IconBroken.Profile,
                  color: defaultColor,),
                  label: 'Profile',
                ),
              ],
            ) ,
          );
        } ,

    );

  }
}