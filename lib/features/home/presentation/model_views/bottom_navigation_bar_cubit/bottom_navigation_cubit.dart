import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_navigation_bar_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationCubit() : super(BottomNavigationBarInitial());

  var _selectedIndex = 0;

  int get getSelectedIndex {
    return _selectedIndex;
  }

  set changeSelectedIndex(int newIndex) {
    _selectedIndex = newIndex;
    emit(BottomNavigationBarIndexChanged());
  }
}
