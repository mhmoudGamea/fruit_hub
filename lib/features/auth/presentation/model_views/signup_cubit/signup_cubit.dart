import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  var _isChecked = false;

  void checkTermsAndConditions() {
    _isChecked = !_isChecked;
    _isChecked
        ? emit(TermsAndConditionsAccepted())
        : emit(TermsAndConditionsNotAccepted());
  }

  bool get getIsChecked {
    return _isChecked;
  }
}
