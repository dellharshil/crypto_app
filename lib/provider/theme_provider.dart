import 'package:crypto_currrencies/model/localstorage.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  ThemeMode? themeMode;
    ThemeProvider(String theme){
      if(theme == "light"){
        themeMode=ThemeMode.light;
      }
      else{
        themeMode=ThemeMode.dark;
      }
    }

  void toggletheme() async{
    if(themeMode==ThemeMode.light){
      themeMode=ThemeMode.dark;
      await LocalStorage.settheme("dark");
    }
    else{
      themeMode=ThemeMode.light;
      await LocalStorage.settheme("light");
    }
    notifyListeners();
  }
}