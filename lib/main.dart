import 'package:fast_trivia/app/core/database/sqlite_connection_factory.dart';
import 'package:fast_trivia/app_widget.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SqLiteConnectionFactory();

  runApp(const AppWidget());
}
