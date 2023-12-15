import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencService {
  static SharedPreferences? prefs;

  static initPrefs() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  static bool isLoggedIn() {
    return prefs?.containsKey('email') ?? false;
  }

  static saveLoginData(String email, String password) async {
    await PreferencService.initPrefs();
    prefs?.setString('email', email);
    prefs?.setString(
        'password', password); // Consider secure encryption for password
  }

  static loginData() async {
    await PreferencService.initPrefs();
    return prefs?.getString('email');
    // Consider secure encryption for password
  }

  static logout() async {
    await PreferencService.initPrefs();
    prefs?.remove('email');
    prefs?.remove('password');
  }
}
