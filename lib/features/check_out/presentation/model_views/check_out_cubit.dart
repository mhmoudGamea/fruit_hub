import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';

import '../../../../core/utilies/helper.dart';
import '../views/widgets/address_page.dart';
import '../views/widgets/pay_page.dart';
import '../views/widgets/revision_page.dart';
import '../views/widgets/shipping_page.dart';
import 'check_out_state.dart';

enum Pay {
  initial,
  cach,
  card,
}

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit() : super(CheckOutInitial());

  // order entity section
  late OrderEntity _orderEntity;
  OrderEntity get getOrderEntity => _orderEntity;
  set setOrderEntity(OrderEntity order) => _orderEntity = order;

  // steps section
  final List<String> _checkoutStepsNames = [
    'الشحن',
    'العنوان',
    'الدفع',
    'المراجعه',
  ];
  List<String> get getCheckOutStepsNames => [..._checkoutStepsNames];

  // pages views section
  final PageController _pageController = PageController();

  PageController get getPageController => _pageController;

  final List<Widget> _checkoutPages = [
    const ShippingPage(),
    const AddressPage(),
    const PayPage(),
    const RevisionPage(),
  ];
  List<Widget> get getCheckoutPages => [..._checkoutPages];

  var _currentPageIndex = 0;
  int get getCurrentPageIndex => _currentPageIndex;

  set setCurrentPageIndex(int value) {
    _currentPageIndex = value;
    emit(PageViewChanged());
  }

  // shipping section
  Pay _payMethod = Pay.initial;

  Pay get getPayMethod {
    return _payMethod;
  }

  void tooglePayMethod(Pay pay) {
    if (pay == Pay.cach) {
      _payMethod = Pay.cach;
      emit(PayWithCach());
    } else {
      _payMethod = Pay.card;
      emit(PayWithCard());
    }
  }

  // checkout button
  String getButtonName(int index) {
    switch (index) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'تأكيد & استمرار';
      case 3:
        return 'تأكيد الطلب';
      default:
        return 'تتبع الطلب';
    }
  }

  void navigate(BuildContext context, int index) {
    if (_payMethod != Pay.initial) {
      _pageController.animateToPage(
        index,
        duration: const Duration(microseconds: 400),
        curve: Curves.easeIn,
      );
      if (_payMethod == Pay.cach) {
        _orderEntity.isCach = true;
      } else {
        _orderEntity.isCach = false;
      }
      log(_payMethod.toString());
      log(_orderEntity.isCach.toString());
    } else {
      Helper.errorMessage(context, message: 'من فضلك حدد طريقه الدفع');
    }
  }
}
