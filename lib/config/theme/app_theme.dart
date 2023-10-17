import 'package:flutter/material.dart';
import '../../core/utils/colors.dart';

ThemeData appTheme() => ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: ColorPicker.seedColor),
    );
