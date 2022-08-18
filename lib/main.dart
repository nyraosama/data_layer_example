import 'package:data_layer_example/presentation/my_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: deprecated_member_use
  Sqflite.devSetDebugModeOn(kDebugMode);
  runApp(const MyApp());
}
