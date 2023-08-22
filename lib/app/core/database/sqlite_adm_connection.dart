import 'package:fast_trivia/app/core/database/sqlite_connection_factory.dart';
import 'package:flutter/material.dart';

class SqLiteAdmConnection with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final connection = SqLiteConnectionFactory();

    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        connection.closeConnection();
        break;
    }

    super.didChangeAppLifecycleState(state);
  }
}
