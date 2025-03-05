import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/check_out/domain/entities/address_entity.dart';
import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/check_out/domain/entities/pay_entity.dart';

import '../../../../../core/utilies/helper.dart';
import '../../views/widgets/address_page.dart';
import '../../views/widgets/pay_page.dart';
import '../../views/widgets/revision_page.dart';
import '../../views/widgets/shipping_page.dart';
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

  // used when press on buttonpage or steppage
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
    } else {
      Helper.errorMessage(context, message: 'من فضلك حدد طريقه الدفع');
    }
  }

  // form in address page
  final GlobalKey<FormState> _addressFormKey = GlobalKey();
  AutovalidateMode _addressAutovalidateMode = AutovalidateMode.disabled;

  set setAddressAutoValidateMode(AutovalidateMode value) =>
      _addressAutovalidateMode = value;

  GlobalKey<FormState> get getAddressFormKey => _addressFormKey;
  AutovalidateMode get getAddressAutoValidateMode => _addressAutovalidateMode;

  late String _name, _email, _phone, _address, _city, _floor, _saveAddress;
  bool _isSaveAddress = false;

  String get name => _name;
  String get email => _email;
  String get phone => _phone;
  String get address => _address;
  String get city => _city;
  String get floor => _floor;
  String get savedAddress => _saveAddress;
  bool get isSaveAddress => _isSaveAddress;

  set setName(String value) => _name = value;
  set setEmail(String value) => _email = value;
  set setPhone(String value) => _phone = value;
  set setAddress(String value) => _address = value;
  set setCity(String value) => _city = value;
  set setFloor(String value) => _floor = value;
  set setSavedAddress(String value) => _saveAddress = value;
  void toggleIsSaveAddress() {
    _isSaveAddress = !_isSaveAddress;
    if (_isSaveAddress == true) {
      emit(SaveMyAddress());
    } else {
      emit(DontSaveMyAddress());
    }
  }

  AddressEntity getAddressEntity() {
    return AddressEntity(
      name: name,
      email: email,
      number: phone,
      address: address,
      city: city,
      floor: floor,
    );
  }

  // pay section

  final GlobalKey<FormState> _payFormKey = GlobalKey();
  GlobalKey<FormState> get getPayFormKey => _payFormKey;

  AutovalidateMode _payAutovalidateMode = AutovalidateMode.disabled;
  AutovalidateMode get getPayAutoValidateMode => _payAutovalidateMode;
  set setPayAutoValidateMode(AutovalidateMode value) =>
      _payAutovalidateMode = value;

  //////////////////////////////////////
  ValueNotifier<AutovalidateMode> addressAutoValidate =
      ValueNotifier(AutovalidateMode.disabled);

  ValueNotifier<AutovalidateMode> payAutoValidate =
      ValueNotifier(AutovalidateMode.disabled);

  late String _cardOwner, _cardNumber, _expiaryDate, _cvv;

  String get cardOwner => _cardOwner;
  String get cardNumber => _cardNumber;
  String get expiaryDate => _expiaryDate;
  String get cvv => _cvv;

  set setCardOwner(String value) => _cardOwner = value;
  set setCardNumber(String value) => _cardNumber = value;
  set setExpiaryDate(String value) => _expiaryDate = value;
  set setcvv(String value) => _cvv = value;

  PayEntity getPayEntity() {
    return PayEntity(
      cardOwner: cardOwner,
      cardNumber: cardNumber,
      expiaryDate: expiaryDate,
      cvv: cvv,
    );
  }
}
