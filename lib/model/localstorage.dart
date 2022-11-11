import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{

  static Future<bool> settheme(String theme)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance() as SharedPreferences;
    bool result=await sharedPreferences.setString("theme", theme);
    return result;
  }
 static Future<String?> gettheme()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance() as SharedPreferences;
    String? currenttheme=(await sharedPreferences.get("theme")) as String?;
    return currenttheme;
  }
  static Future<bool> addfav(String id)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    List<String> fav=sharedPreferences.getStringList("favorite") ?? [];
    fav.add(id);
    return await sharedPreferences.setStringList("favorite", fav);
  }
  static Future<bool> removefav(String id)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    List<String> fav=sharedPreferences.getStringList("favorite") ?? [];
    fav.remove(id);
    return await sharedPreferences.setStringList("favorite", fav);
  }

 static Future<List<String>> fetchfav()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return await sharedPreferences.getStringList("favorite") ?? [];
  }


}