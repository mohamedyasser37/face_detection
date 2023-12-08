import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
static HomeCubit get(context)=>BlocProvider.of(context);
int currentIndex=0;
List<BottomNavigationBarItem> bottomItem=[
  BottomNavigationBarItem(icon: Icon(Icons.home,),label: "Home"),
  BottomNavigationBarItem(icon: Icon(Icons.favorite,),label: "Favorite"),
  BottomNavigationBarItem(icon: Icon(Icons.list,),label: "List"),
  BottomNavigationBarItem(icon: Icon(Icons.more_vert,),label: "More"),
  BottomNavigationBarItem(icon: Icon(Icons.bookmark_add,),label: "PDF"),
];
List<Widget> bottomWidget=[
  Column(
    children: [
      Icon(Icons.home,),
      Text('Home'),
    ],
  ),
  Column(
    children: [
      Icon(Icons.favorite,),
      Text('Favorite'),
    ],
  ),
  Column(
    children: [
      Icon(Icons.list,),
      Text('List'),
    ],
  ),
  Column(
    children: [
      Icon(Icons.more_vert,),
      Text('Test Camera'),
    ],
  ),
  Column(
    children: [
      Icon(Icons.bookmark_add,),
      Text('Pdf'),
    ],
  ),
  Column(
    children: [
      Icon(Icons.videocam,),
      Text('Zoom'),
    ],
  ),
];

void changeBottomNavBar(int index,BuildContext context){
  currentIndex=index;

  emit(HomeBottomNavBar());
}
var isDark=false;
void changeMode(){
    isDark=!isDark;
    emit(ChangeMode());


}

  var isEnglish=false;

void changeLanguage(){
  isEnglish=!isEnglish;
    emit(ChangeLanguage());


}

}
