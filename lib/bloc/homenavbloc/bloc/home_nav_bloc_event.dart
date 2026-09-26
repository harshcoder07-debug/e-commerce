import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

abstract class HomeNavBlocEvent {}

class tabchanged extends HomeNavBlocEvent {
  final int index;

  tabchanged(this.index);
}
class navhide extends HomeNavBlocEvent{}

class navshow extends HomeNavBlocEvent{}