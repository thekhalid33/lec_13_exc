import 'package:flutter/material.dart';
import 'package:lec_13_exc/helpers/sharedPrefrencess_helper.dart';
import 'package:lec_13_exc/home_screen.dart';
import 'package:lec_13_exc/sgin_screens/main_register_screen.dart';

class SplachScreen extends StatelessWidget {
  static final routeName = '/spalch';
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      if (SpHelper.spHelper.getUser() != null) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      } else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return MainRegister();
        }));
      }
    });
    return Scaffold();
  }
}
