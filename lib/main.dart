import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppicart/presentation/home/home.dart';
import 'package:shoppicart/presentation/routes/routes.dart';
import 'package:shoppicart/presentation/widgets/listProduct.widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
      ),
      dark: ThemeData(
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
      initial: AdaptiveThemeMode.dark,
      builder:  (theme, darkTheme) =>MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme,
        darkTheme: darkTheme,
        home: HomeProducts(),
        initialRoute: "home",
        routes: Routes.getRoutes(context:context),
      ),
    );
  }
}
