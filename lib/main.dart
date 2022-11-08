import 'package:flutter/material.dart';
import 'package:giphy_flutter_app/giphy_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GiphyApp());
}