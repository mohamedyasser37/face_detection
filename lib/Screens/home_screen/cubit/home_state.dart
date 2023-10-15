part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeBottomNavBar extends HomeState {}
class ChangeMode extends HomeState {}
class ChangeLanguage extends HomeState {}
