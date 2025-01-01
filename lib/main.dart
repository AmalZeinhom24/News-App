import 'package:flutter/material.dart';
import 'package:news/layout/home_layout.dart';
import 'package:news/providers/settings_provider.dart';
import 'package:news/screens/details_screen.dart';
import 'package:news/screens/settings_screen.dart';
import 'package:news/screens/splash_screen.dart';
import 'package:news/shared/styles/theming.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var pro = MyProvider();
  await pro.loadThemeData();
  await pro.loadLanguageData();

  runApp(
    ChangeNotifierProvider<MyProvider>(
        create: (BuildContext context) => pro, child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.currentLocal),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeLayout.routeName: (context) => HomeLayout(),
        DetailsScreen.routeName: (context) => DetailsScreen(),
        SettingsTab.routeName: (context) => SettingsTab(),
      },
        themeMode: provider.theme,
        theme: MyThemeData.lightTheme,
        darkTheme: MyThemeData.darkTheme
    );
  }
}
