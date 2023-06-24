import 'package:crypto_currrencies/contant/themes.dart';
import 'package:crypto_currrencies/model/localstorage.dart';
import 'package:crypto_currrencies/pages/homepage.dart';
import 'package:crypto_currrencies/provider/ad_provider.dart';
import 'package:crypto_currrencies/provider/market_provider.dart';
import 'package:crypto_currrencies/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //MobileAds.instance.initialize();
String currenttheme=await LocalStorage.gettheme() ?? "light";
  runApp(MyApp(
    theme: currenttheme,
  ));
}
class MyApp extends StatelessWidget {
   MyApp({Key? key, required this.theme}) : super(key: key);
final String theme;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<MarketProvider>(create: (context) => MarketProvider(),),
          ChangeNotifierProvider<ThemeProvider>(create: (context) => ThemeProvider(theme),),
        //  ChangeNotifierProvider<AdProvider>(create: (context) => AdProvider(),)
        ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lighttheme,
            themeMode: value.themeMode,
            darkTheme: darktheme,
            home: Homepage(),
          );
        },
      ),
    );
  }
}
