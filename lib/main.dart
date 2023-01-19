import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'ApiService.dart';
late List coinlistesi;
late List haberlistesi;
late List trendcoinlist;
int second=3;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: second), () => Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage(),)),);
    apicall();
    second=1;
  }

  Future<String> apicall() async{
    final responsecoin = await http.get(Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"));
    final responsehaber= await http.get(Uri.parse("https://newsapi.org/v2/everything?q=kripto&apiKey=db0ae0da8b25467090df2d03dbf100dc"));
    final responsetrend= await http.get(Uri.parse("https://api.coingecko.com/api/v3/search/trending"));

    setState(() {
      var convertDatatoJsonhaber= jsonDecode(responsehaber.body);
      var convertDataToJsoncoin = jsonDecode(responsecoin.body);
      var convertDataToJsontrend= jsonDecode(responsetrend.body);
      haberlistesi=convertDatatoJsonhaber['articles'];
      coinlistesi= convertDataToJsoncoin;
      trendcoinlist= convertDataToJsontrend['coins'];
    });

    return "Basarili";
  }





  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blue,
      body: Center(child: Container(child: Text("CRYPUB MARKET",style: TextStyle(color: Colors.white,fontSize: 42.0,fontStyle: FontStyle.italic)),)),
    );
  }
}



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  

  int indeximiz = 0;



  @override



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,title: Text("CRYPUB MARKET"),centerTitle: true,leading: IconButton(icon:Icon(Icons.restart_alt_rounded),onPressed: (){
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>SplashScreen(),));
        });
      },)),



      bottomNavigationBar: CurvedNavigationBar(backgroundColor: Colors.white,
        color: Colors.blue,
        animationDuration: (Duration(milliseconds: 231)),
        items: [
          Icon(Icons.home,color: Colors.white),
          Icon(Icons.currency_exchange,color: Colors.white),
          Icon(Icons.trending_up,color: Colors.white),
          Icon(Icons.settings,color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            indeximiz = index;
            controller(indeximiz);
          });
        },
      ),
      backgroundColor: Colors.blueGrey.shade100,
      body: Container(child:controller(indeximiz)),

    );
  }

}