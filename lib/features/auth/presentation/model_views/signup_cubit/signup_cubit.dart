import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/repos/auth_repo.dart';
import '../../../domain/repos/auth_repo_impl.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  /// handling create new user part
  final AuthRepo _authRepo = GetIt.instance<AuthRepoImpl>();
  Future<void> signupUser({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignupLoading());
    final data = await _authRepo.createUserWithEmailAndPassword(
        email: email, password: password, name: name);
    data.fold((error) {
      emit(SignupFailure(error: error.message));
    }, (userEntity) {
      emit(SignupSuccess(userEntity: userEntity));
    });
  }

  /// handling terms and conditions part
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
