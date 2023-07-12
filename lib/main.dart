import 'package:exam/services/shared_preferences/cash_helper.dart';
import 'package:exam/src/app_root.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(AppRoot());
}
