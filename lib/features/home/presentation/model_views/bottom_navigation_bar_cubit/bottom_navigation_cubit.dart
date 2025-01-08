import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationInitial());

  var _selectedIndex = 0;

  int get getSelectedIndex {
    return _selectedIndex;
  }

  set changeSelectedIndex(int newIndex) {
    _selectedIndex = newIndex;
    emit(BottomNavigationIndexChanged());
  }
}
