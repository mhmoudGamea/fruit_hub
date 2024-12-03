import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller_state.dart';

class ControllerCubit extends Cubit<ControllerState> {
  ControllerCubit() : super(PageChangeInitial());

  late PageController _pageController;
  var _currentPage = 0;

  setListner() {
    _pageController = PageController();

    _pageController.addListener(() {
      _currentPage = _pageController.page!.round();
      _currentPage == 0
          ? emit(PageNotChanged(isVisible: true))
          : emit(PageChanged(isVisible: false));
    });
  }

  PageController get getPageController {
    return _pageController;
  }

  int get getCurrentPage {
    return _currentPage;
  }

  void disposeController() {
    _pageController.dispose();
  }
}
