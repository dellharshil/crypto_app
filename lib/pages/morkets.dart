import 'package:crypto_currrencies/pages/listilewid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/crptocurrency.dart';
import '../provider/market_provider.dart';
import 'details.dart';

class Markets extends StatelessWidget {
  const Markets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Consumer<MarketProvider>(
      builder: (context, value, child) {
        if(value.isloading==true){
          return Center(child: CircularProgressIndicator(),);
        }
        else{
          if(value.market1.length>0){

            return RefreshIndicator(
              onRefresh: () async{
                await value.fetchdata();
              },
              child: ListView.builder(
                itemCount: value.market1.length,
                physics: BouncingScrollPhysics(
                  parent:AlwaysScrollableScrollPhysics(),
                ),
                itemBuilder:(context, index) {
                  Sample crypto=value.market1[index];
                  return Listtilewid(crypto: crypto);
                },
              ),
            );
          }
          else{
            return Text("data not found");
          }
        }
      },
    );
  }
}
