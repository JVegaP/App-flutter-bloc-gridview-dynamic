import 'package:flutter/cupertino.dart';
import 'package:giphy_flutter_app/presentation/home/home_screen.dart';

final routes = Routes();
class Routes {
  /// go to Home Screen
  openHomeScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) => const HomeScreen()));
  }
}