import 'package:endeavor_stake_pools/screens/dashboard.dart';
//import 'package:endeavor_stake_pools/screens/pool_details.dart';
import 'package:flutter/material.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
//import 'package:flutter/services.dart';

const String intitialTitle = 'Endeavor';

void main() {
  runApp(MyApp());
  //SystemChrome.setEnabledSystemUIOverlays([]);
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
      //home: DashboardScreen(title: intitialTitle),
      home: SplashScreenGame(), //OtherScreen(),
      // routes: {
      //   DashboardScreen.id: (context) => DashboardScreen(title: intitialTitle),
      //   PoolDetails.id: (context) => PoolDetails(title: ''),
      // },
      // initialRoute: DashboardScreen.id,
      //debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreenGame extends StatefulWidget {
  @override
  _SplashScreenGameState createState() => _SplashScreenGameState();
}

class _SplashScreenGameState extends State<SplashScreenGame> {
  FlameSplashController controller;

  @override
  void initState() {
    super.initState();
    controller = FlameSplashController(
        fadeInDuration: Duration(seconds: 2),
        fadeOutDuration: Duration(seconds: 1),
        waitDuration: Duration(seconds: 1),
        autoStart: true);
  }

  @override
  void dispose() {
    controller.dispose(); // dispose it when necessary
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlameSplashScreen(
        // showBefore: (BuildContext context) {
        //   return Text("Before the logo");
        // },
        // showAfter: (BuildContext context) {
        //   return Text("After the logo");
        // },
        theme: FlameSplashTheme(
          backgroundDecoration: const BoxDecoration(color: Color(0xFF000000)),
          logoBuilder: (context) => Image(
            width: 300,
            image: const AssetImage(
              'assets/flame-logo-black.gif',
              package: 'flame_splash_screen',
            ),
          ),
        ),
        //onFinish: (context) => Navigator.pop(context),
        onFinish: (BuildContext context) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(
              title: intitialTitle,
            ),
          ),
        ),
        controller: controller,
      ),
    );
  }
}
