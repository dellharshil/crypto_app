import 'dart:convert';

import 'package:http/http.dart' as http;

class API{
 static Future<List<dynamic>> getdata() async{
   try{
     final response=await http.get(Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=20&page=1&sparkline=false"));
     var data=jsonDecode(response.body);
     List<dynamic> markets=data;
     return markets;
   }
   catch(ex){
     return [];
   }
  }
}