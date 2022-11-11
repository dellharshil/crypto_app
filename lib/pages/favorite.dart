import 'package:crypto_currrencies/pages/listilewid.dart';
import 'package:crypto_currrencies/provider/market_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/crptocurrency.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MarketProvider>(
        builder:(context, value, child) {
        List<dynamic> favorites=value.market1.where((element) => element.favorite==true).toList();
            if(favorites.length > 0){
              return ListView.builder(
                itemCount:favorites.length,itemBuilder:
                  (context, index) {
                Sample crypto=favorites[index];
                return Listtilewid(crypto: crypto);
              },
              );
            }
         else{
           return Center(
             child: Text("No Favorites yet!!!!",style: TextStyle(fontSize: 19,color: Colors.grey),),
           );
            }
        },
    );
  }
}
