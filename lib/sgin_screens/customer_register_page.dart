import 'package:flutter/material.dart';
import 'package:lec_13_exc/helpers/sharedPrefrencess_helper.dart';
import 'package:lec_13_exc/router/app_router.dart';

import '../home_screen.dart';
import '../models/form_user.dart';

class CustomerRegister extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email;
  String password;

  setEmail(String email) {
    this.email = email;
  }

  setPassword(String password) {
    this.password = password;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: TextFormField(
              onSaved: (v) {
                setEmail(v);
              },
              // ignore: missing_return
              validator: (v) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'Email',
                fillColor: Colors.blue.withOpacity(0.2),
                filled: true,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: TextFormField(
              onSaved: (v) {
                setPassword(v);
              },
              // ignore: missing_return
              validator: (v) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'Password',
                fillColor: Colors.blue.withOpacity(0.2),
                filled: true,
              ),
            ),
          ),
          ElevatedButton(
            child: Text('Sign Up As Customer'),
            onPressed: () async {
              // await SpHelper.spHelper.saveUserName('khalid');
              // print(SpHelper.spHelper.getUserName());
              if (formKey.currentState.validate()) {
                formKey.currentState.save();
                FormUser formUser =
                    FormUser.customer(email: email, password: password);
                SpHelper.spHelper.saveUser(formUser);
                AppRouter.router.pushFunction(HomeScreen());

                //Globals.globals.formUser = formUser;
                // dynamic result =
                //      await Navigator.of(context).pushNamed('/home');
                // AppRouter.router.pushNamedFunction('/home');
                // print(result);
              }
            },
          ),
        ],
      ),
    );
  }
}
