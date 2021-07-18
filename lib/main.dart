import 'package:flutter/material.dart';
import 'package:lec_13_exc/sgin_screens/splach_screen.dart';
import 'helpers/sharedPrefrencess_helper.dart';
import 'router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SpHelper.spHelper.initSharedPreferences();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: AppRouter.router.navKey,
      // routes: {
      //   MainRegister.routeName : (context) => MainRegister(),
      //   HomeScreen.routeName : (context) => HomeScreen(),
      // },
      onGenerateRoute: AppRouter.router.onGenerateRoute,
      // onUnknownRoute: (RouteSettings r){},
      home: SplachScreen(),
      // initialRoute: SplachScreen.routeName,
    );
  }
}
Git commit -m "addign local storage "

Git push origin master