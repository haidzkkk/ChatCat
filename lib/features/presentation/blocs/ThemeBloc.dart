import '../../common/constants/pref_constants.dart';
import '../../di/InjectionContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeThemeCubit extends Cubit<ThemeMode> {
  ChangeThemeCubit() : super(ThemeMode.system);

  final SharedPreferences themeMode = sl<SharedPreferences>();

  void changeTheme() {
    bool? isDarkMode = themeMode.getBool(Constants.keyTheme);
    if (isDarkMode!) {
      emit(ThemeMode.dark);
    } else if (!isDarkMode) {
      emit(ThemeMode.light);
    } else {
      emit(ThemeMode.system);
    }
  }
}
