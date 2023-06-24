import 'package:crypto_currrencies/model/crptocurrency.dart';
import 'package:crypto_currrencies/provider/ad_provider.dart';
import 'package:crypto_currrencies/provider/market_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.id}) : super(key: key);
final String id;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  Widget titledetails(String title,String detail,CrossAxisAlignment crossAxisAlignment){
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(title,style: TextStyle(fontSize:17,fontWeight: FontWeight.bold),),
        Text(detail,style: TextStyle(fontSize: 17),)
      ],
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Provider.of<AdProvider>(context,listen: false).detailspagebanner;
    // Provider.of<AdProvider>(context,listen: false).fullpagead;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20,right: 20),
          child: Consumer<MarketProvider>(
            builder: (context, value, child) {
              Sample currentcrypto=value.fetchcryptobyid(widget.id);
              return RefreshIndicator(
                onRefresh: () async{
                  await value.fetchdata();
                },
                child: ListView(
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  children: [
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: CircleAvatar(backgroundImage: NetworkImage(currentcrypto.image),),
                        title: Text(currentcrypto.name+"(${currentcrypto.symbol.toUpperCase()})",
                          style: TextStyle(fontSize: 20),),
                        subtitle: Text("INR "+currentcrypto.currentPrice.toStringAsFixed(4), style:
                          TextStyle(fontWeight:FontWeight.bold,fontSize: 28,color: Colors.blue)
                          ,),

                      ),
                    SizedBox(height: 20,),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Price Change (24)",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                        Builder(
                            builder:(context) {
                              double pricechange=currentcrypto.priceChange24H;
                              double pricechangeper=currentcrypto.priceChangePercentage24H;
                              if(pricechange<0){
                                return Text("${currentcrypto.priceChangePercentage24H.toStringAsFixed(3)}"
                                    "%(${currentcrypto.priceChange24H.toStringAsFixed(4)}),",style: TextStyle(
                                  color: Colors.red,fontSize: 23,
                                ),);
                              }
                              else{
                                return Text("${currentcrypto.priceChangePercentage24H.toStringAsFixed(3)}"
                                    "%(${currentcrypto.priceChange24H.toStringAsFixed(4)}),",style: TextStyle(
                                  color: Colors.green,fontSize: 23,
                                ),);
                              }
                            },
                        ),
                      ],
                    ),
                    SizedBox(height: 28,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        titledetails("Market cap","₹"+currentcrypto.marketCap.toStringAsFixed(4) ,CrossAxisAlignment.start),
                        titledetails("Market cap Rank","₹"+currentcrypto.marketCapRank.toString(),CrossAxisAlignment.end),
                      ],
                    ),

                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        titledetails("Low 24","₹"+currentcrypto.low24H.toStringAsFixed(4) ,CrossAxisAlignment.start),
                        titledetails("High 24","₹"+currentcrypto.high24H.toStringAsFixed(4),CrossAxisAlignment.end),
                      ],
                    ),

                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        titledetails("All Time Low",currentcrypto.atl.toString(),CrossAxisAlignment.start),
                        titledetails("All Time High",currentcrypto.ath.toString(),CrossAxisAlignment.end),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        titledetails("Curculating supply",currentcrypto.circulatingSupply.toString(),CrossAxisAlignment.start),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        titledetails("Last Updated",currentcrypto.lastUpdated.toString(),CrossAxisAlignment.start),

                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      // floatingActionButton: Consumer<AdProvider>(
      //   builder: (context, value, child) {
      //     if(value.isdetailspagebanner){
      //       return Container(
      //         height: value.detailspagebanner.size.height.toDouble(),
      //         child: AdWidget(ad: value.homepagebanner),
      //       );
      //     }
      //     else{
      //       return Container(height: 0,);
      //     }
      //   },
      // ),
    );
  }

}
