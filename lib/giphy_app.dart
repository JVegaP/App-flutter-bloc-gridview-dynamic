import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giphy_flutter_app/core/themes/app_theme.dart';
import 'package:giphy_flutter_app/presentation/home/bloc/home_bloc.dart';
import 'package:giphy_flutter_app/presentation/splash/bloc/splash_bloc.dart';
import 'package:giphy_flutter_app/presentation/splash/splash_screen.dart';

class GiphyApp extends StatefulWidget {
  const GiphyApp({
    Key? key
  }) : super(key: key);

  @override
  GiphyAppState createState() => GiphyAppState();
}

class GiphyAppState extends State<GiphyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SplashBloc()),
          BlocProvider(create: (_) => HomeBloc())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          theme: AppTheme.getAppTheme(),
        )
    );
  }
}