import 'dart:convert';

import '../globals.dart';
import 'package:lec_13_exc/models/form_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  SpHelper._();
  static final spHelper = SpHelper._();
  SharedPreferences sharedPreferences;

  initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  saveUserName(String name) {
    sharedPreferences.setString('name', name);
  }

  String getUserName() {
    return sharedPreferences.getString('name');
  }

  saveUser(FormUser formUser) {
    sharedPreferences.setString('formUser', json.encode({...formUser.toMap()}));
    Globals.globals.formUser = formUser;
  }

  FormUser getUser() {
    String user = sharedPreferences.getString('formUser');
    if (user == null) {
      return null;
    }
    Map userMap = jsonDecode(user);
    FormUser formUser = FormUser.map(userMap);
    Globals.globals.formUser = formUser;
    return formUser;
  }

  signOut() {
    sharedPreferences.remove('formUser');
  }
}
