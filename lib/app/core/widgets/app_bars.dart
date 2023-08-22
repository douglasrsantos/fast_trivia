import 'package:fast_trivia/app/core/ui/app_fonts.dart';
import 'package:flutter/material.dart';

class AppBars extends AppBar {
  AppBars({Key? key})
      : super(
          key: key,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: AppFonts.appBarTitle,
          centerTitle: true,
          elevation: 0,
        );
}