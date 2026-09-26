

abstract class HomeNavBlocEvent {}

class tabchanged extends HomeNavBlocEvent {
  final int index;

  tabchanged(this.index);
}
class navhide extends HomeNavBlocEvent{}

class navshow extends HomeNavBlocEvent{}