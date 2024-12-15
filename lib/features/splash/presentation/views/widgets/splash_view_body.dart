import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/features/home/presentation/views/home_view.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/services/preferences.dart';
import '../../../../../core/utilies/app_images.dart';
import '../../../../auth/presentation/views/signin_view.dart';
import '../../../../on_boarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    _onBoardingNavigation();
  }

  _initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.4, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  _onBoardingNavigation() {
    Future.delayed(
      const Duration(seconds: 6),
      () {
        final status = Preferences.checkOnBoardingStatus();
        status
            ? _userState()
            : GoRouter.of(context).pushReplacement(OnBoardingView.rn);
      },
    );
  }

  /// if user is already signed in, ther are redirected to home otherwise
  /// he 'll be redirect to signin
  _userState() {
    final firebaseAuth = GetIt.instance<FirebaseAuth>();
    if (firebaseAuth.currentUser != null) {
      return GoRouter.of(context).pushReplacement(HomeView.rn);
    }
    return GoRouter.of(context).pushReplacement(SigninView.rn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: SvgPicture.asset(
            AppImages.plant,
          ),
        ),
        FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: SvgPicture.asset(
              AppImages.appLogo,
            ),
          ),
        ),
        SvgPicture.asset(
          AppImages.circlesBottom,
        ),
      ],
    );
  }
}
