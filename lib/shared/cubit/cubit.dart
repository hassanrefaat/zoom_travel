import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_travel/screens/Explore/Explore_Screen.dart';
import 'package:zoom_travel/screens/Favourite/Favourite_Screen.dart';
import 'package:zoom_travel/screens/Trips/Trips_Screen.dart';
import 'package:zoom_travel/screens/home/Home_Screen.dart';
import 'package:zoom_travel/shared/cubit/states.dart';

import '../../screens/Profile/Profile_Screen.dart';
import '../network/local/cache_helper.dart';

class ZoomCubit extends Cubit <ZoomStates>{
ZoomCubit() : super(ZoomInitialState());
  static ZoomCubit get(context)=>BlocProvider.of(context);
  int currentindex = 0 ;
  List<Widget> BottomScreens=
  [
    HomeScreen(),
    ExploreScreen(),
    FavouriteScreen(),
    TripsScreen(),
    ProfileScreen(),

  ];
  // List<String> titles=
  // [
  //     'Home',
  //     'Favourite',
  //     'Category',
  //     'Setting',
  // ];
  void changeBottomScreen (int index)

  {
    currentindex =index;
    emit(ZoomChangeBottomState());
  }
// bool isDark=false;
// void changeAppMode({ bool? fromShared})
// {
//   if( fromShared != null)
//   {
//     isDark = fromShared;
//     emit(ZoomChangeModeState());
//
//   }
//   else{
//
//   }
//   isDark=!isDark;
//   CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value)
//   {
//     emit(ZoomChangeModeState());
//   });
//
// }
}