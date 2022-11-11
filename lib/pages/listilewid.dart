import 'package:crypto_currrencies/provider/market_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/crptocurrency.dart';
import 'details.dart';


class Listtilewid extends StatelessWidget {
  const Listtilewid({Key? key, required this.crypto}) : super(key: key);
final Sample crypto;
  @override
  Widget build(BuildContext context) {
    MarketProvider value=Provider.of(context,listen: false);
    return ListTile(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:
            (context) => DetailsPage(id: crypto.id),
        ));
      },
      contentPadding: EdgeInsets.all(0),
      leading:CircleAvatar(backgroundImage: NetworkImage(crypto.image),),
      title: Row(
        children: [
          Text(crypto.name ,overflow:TextOverflow.ellipsis,),SizedBox(width: 7,),
          (crypto.favorite==false)?GestureDetector(
            onTap: (){
              value.addfav(crypto);
            },
            child: Icon(CupertinoIcons.heart,size: 17,),
          ) : GestureDetector(
            onTap: (){
              value.removefav(crypto);
            },
            child: Icon(CupertinoIcons.heart_fill,size: 17,color: Colors.red,),)
        ],
      ),
      subtitle: Text(crypto.symbol.toUpperCase()),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("₹"+crypto.currentPrice.toStringAsFixed(3),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600,fontSize: 18),),
          Builder(
            builder:(context) {
              double pricechange=crypto.priceChange24H;
              double pricechangeper=crypto.priceChangePercentage24H;
              if(pricechange<0){
                return Text("${pricechangeper.toStringAsFixed(2)}%"
                    " (${pricechange.toStringAsFixed(3)}),)",style: TextStyle(
                    color: Colors.red
                ),);
              }
              else{
                return Text("${pricechangeper.toStringAsFixed(2)}% (${pricechange.toStringAsFixed(3)})",
                  style: TextStyle(color: Colors.green),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
