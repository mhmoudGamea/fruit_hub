import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // ANSI escape code for setting text color to yellow
    const yellowColorCode = '\x1B[33m';

    // ANSI escape code for resetting text color
    const resetColorCode = '\x1B[0m';
    print('$yellowColorCode ${bloc.runtimeType} $change $resetColorCode');
  }
}
