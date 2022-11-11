import 'package:crypto_currrencies/model/crptocurrency.dart';
import 'package:crypto_currrencies/pages/details.dart';
import 'package:crypto_currrencies/pages/morkets.dart';
import 'package:crypto_currrencies/provider/market_provider.dart';
import 'package:crypto_currrencies/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favorite.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider=Provider.of<ThemeProvider>(context,listen: false);
    return DefaultTabController(
      length: 2,
      child: Scaffold(

        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Crypto Today",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 35),),
                    IconButton(onPressed: (){
                      themeProvider.toggletheme();
                    },
                        padding: EdgeInsets.all(0),
                        icon: (themeProvider.themeMode==ThemeMode.light)?Icon(Icons.dark_mode):
                    Icon(Icons.light_mode),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
              TabBar(
                  tabs: [
                   Tab(child: Text("Market",style: Theme.of(context).textTheme.bodyText1,),),
                    Tab(child: Text("Favorites",style: Theme.of(context).textTheme.bodyText1,),)
                  ],
              ),

                Expanded(
                  child: TabBarView(
                    physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                      children:[
                        Markets(),
                        Favorites(),
                      ]
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
