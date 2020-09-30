import 'package:endeavor_stake_pools/screens/dashboard.dart';
//import 'package:endeavor_stake_pools/screens/pool_details.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Endeavor Stake Pools',
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF0d3c60),
        //visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'NotoSans',
              bodyColor: Colors.black87,
              //displayColor: Colors.red,
            ),
      ),
      home: DashboardScreen(title: 'Endeavor'),
      // routes: {
      //   DashboardScreen.id: (context) => DashboardScreen(title: 'Endeavor'),
      //   PoolDetails.id: (context) => PoolDetails(title: ''),
      // },
      // initialRoute: DashboardScreen.id,
    );
  }
}
