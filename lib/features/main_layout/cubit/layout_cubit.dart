import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  int currentIndex = 0;

  void changeTab(int index) {
    currentIndex = index;
    emit(LayoutTabChanged(index));
  }
}
