import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
static HomeCubit get(context)=>BlocProvider.of(context);
int currentIndex=0;

List<Widget> bottomWidget=[

  Column(

    children: [
      Icon(Icons.favorite,color: Colors.white,),
      Text('Favorite',style: TextStyle(color: Colors.white),),
    ],
  ),
  Column(
    children: [
      Icon(Icons.list,color: Colors.white,),
      Text('List',style: TextStyle(color: Colors.white),),
    ],
  ),
  Column(
    children: [
      Icon(Icons.more_vert,color: Colors.white,),
      Text('Test Camera',style: TextStyle(color: Colors.white),),
    ],
  ),
  Column(
    children: [
      Icon(Icons.bookmark_add,color: Colors.white,),
      Text('Pdf',style: TextStyle(color: Colors.white),),
    ],
  ),
  Column(
    children: [
      Icon(Icons.videocam,color: Colors.white,),
      Text('Zoom',style: TextStyle(color: Colors.white),),
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
