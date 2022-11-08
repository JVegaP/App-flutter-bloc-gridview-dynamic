import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giphy_flutter_app/core/constants/app_constants.dart';
import 'package:giphy_flutter_app/core/constants/color_constants.dart';
import 'package:giphy_flutter_app/core/constants/style_constants.dart';
import 'package:giphy_flutter_app/core/managers/routes_manager.dart';
import 'package:giphy_flutter_app/presentation/splash/bloc/splash_bloc.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({
    Key? key
  }): super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controllerAnimation;
  SplashBloc bloc = SplashBloc();
  @override
  void initState() {
    _controllerAnimation = AnimationController(vsync: this ,duration: const Duration(milliseconds: kDurationMilSeconds3700));
    bloc = BlocProvider.of<SplashBloc>(context, listen: false);
    _loadView(context);
    super.initState();
  }

  @override
  void dispose() {
    _controllerAnimation.dispose();
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: _mainContainer(),
    );
  }

  Widget _mainContainer() {
    return Stack(
      children: [
        Center(
          child: Lottie.asset(
            kAnimationSplash,
            width: kDimens200, height: kDimens200,
            controller: _controllerAnimation,
            fit: BoxFit.contain,
            repeat: true,
            onLoaded: (composition) async {
              _controllerAnimation.duration = composition.duration;
            },
          ),
        )
      ],
    );
  }

  /// Method that create
  void _loadView(BuildContext context) async {
    _controllerAnimation.value = kDefaultValueInt;
    _controllerAnimation.duration = const Duration(milliseconds: kDurationMilSeconds4500);
    _controllerAnimation.repeat();
    await Future.delayed( const Duration(milliseconds: kDurationMilSeconds3700 ),(){
      _navigateToHome();
    });
  }

  /// Method that navigate to home
  void _navigateToHome() {
    bloc.isLoading = false;
    routes.openHomeScreen(context);
  }
}