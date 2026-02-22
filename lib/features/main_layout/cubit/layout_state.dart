abstract class LayoutState {}

class LayoutInitial extends LayoutState {}

class LayoutTabChanged extends LayoutState {
  final int index;

  LayoutTabChanged(this.index);
}
