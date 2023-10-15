import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
static HomeCubit get(context)=>BlocProvider.of(context);
int currentIndex=0;
List<BottomNavigationBarItem> bottomItem=[
  const BottomNavigationBarItem(icon: Icon(Icons.home,),label: "Home"),
  const BottomNavigationBarItem(icon: Icon(Icons.favorite,),label: "Favorite"),
  const BottomNavigationBarItem(icon: Icon(Icons.list,),label: "List"),
  const BottomNavigationBarItem(icon: Icon(Icons.more_vert,),label: "More"),
];
List<Widget> bottomWidget=[
  const Column(
    children: [
      Icon(Icons.home,),
      Text('Home'),
    ],
  ),
  const Column(
    children: [
      Icon(Icons.favorite,),
      Text('Favorite'),
    ],
  ),
  const Column(
    children: [
      Icon(Icons.list,),
      Text('List'),
    ],
  ),
  const Column(
    children: [
      Icon(Icons.more_vert,),
      Text('More'),
    ],
  ),
];

void changeBottomNavBar(int index,BuildContext context){
  currentIndex=index;

  emit(HomeBottomNavBar());
}

}
