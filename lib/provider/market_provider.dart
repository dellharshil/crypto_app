import 'dart:async';

import 'package:crypto_currrencies/model/api.dart';
import 'package:crypto_currrencies/model/crptocurrency.dart';
import 'package:crypto_currrencies/model/localstorage.dart';
import 'package:flutter/material.dart';

class MarketProvider with ChangeNotifier{
  bool isloading=true;
  List<dynamic> market1=[];

  MarketProvider(){
    fetchdata();
  }
  Future<void> fetchdata()async{
    List<dynamic> market=await API.getdata();
    List<String> favorites=await LocalStorage.fetchfav();
    List<dynamic> temp=[];
    for(var market1 in market){
      Sample newcrypto=Sample.fromJson(market1);
      
      if(favorites.contains(newcrypto.id)){
        newcrypto.favorite=true;
      }
      temp.add(newcrypto);
    }
    market1=temp;
    isloading=false;
    notifyListeners();


  //other way of upadte to data refresh indicator
    // Timer(Duration(seconds: 3),() {
    //   fetchdata();
    //   print("data updated");
    // },);
  }

  Sample fetchcryptobyid(String id){
    Sample crypto=market1.where((element) => element.id == id).toList()[0];
    return crypto;
  }

  void addfav(Sample crypto) async{
    int index=market1.indexOf(crypto);
    market1[index].favorite=true;
    await LocalStorage.addfav(crypto.id);
    notifyListeners();
  }
  void removefav(Sample crypto) async{
  int index=market1.indexOf(crypto);
  market1[index].favorite=false;
  await LocalStorage.removefav(crypto.id);
  notifyListeners();
  }
}