

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

Widget HousePageDesign(List haberlistesi) {
  return GridView.builder(scrollDirection: Axis.vertical,itemCount: 36 ,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context, index) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(height: 500,
          child: Card(child: Center(
            child: ElevatedButton(onPressed:() async{
              final url = await '${haberlistesi[index]['url'].toString()}';
              Uri urlq= Uri.parse(url);
              if(await canLaunchUrl(urlq)){
                await launchUrl(urlq,mode: LaunchMode.externalNonBrowserApplication);

              }


            } , style: ButtonStyle(shadowColor: MaterialStateProperty.all(Colors.white), backgroundColor: MaterialStateProperty.all(Colors.white)),
              child: Center(
                child: Column(children: [
                    Image(image: NetworkImage(haberlistesi[index]['urlToImage'])),
                    Container(child:Text(haberlistesi[index]['title'].toString(),style: TextStyle(fontSize: 14.0,color: Colors.blue)),)


                  ]),
              ),
            ),
          ),),
        ),
        ),
    );

  },);
}




//...........................................Design Ayrimi....................................................................

Widget TrendPageDesign(List trendcoinlist){
  return ListView.builder(itemCount:7 ,itemBuilder: (context, index) {

    return Card(color: Colors.white ,child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("${trendcoinlist[index]['item']['score']+1}"),
                CircleAvatar(backgroundImage: NetworkImage("${trendcoinlist[index]['item']['large'].toString()}"),),
                SizedBox(width: 20.0,),
                Text("${trendcoinlist[index]['item']['name'].toString().toUpperCase()}", style: TextStyle(color: Colors.black)),


              ]),
          Row(mainAxisAlignment: MainAxisAlignment.start ,children: [
            Text("Rank :"),
            Text(textAlign: TextAlign.center,"${trendcoinlist[index]['item']['market_cap_rank'].toString().toUpperCase()}", style: TextStyle(color: Colors.blue),),
            SizedBox(width:21.0 ,),

          ],)
        ],
      ),
    ),);
  },) ;
}

//...........................................Design Ayrimi....................................................................


Widget MarketPageDesign(List coinlistesi){

  return Container(child: ListView.builder(itemCount: 95,itemBuilder: (context, index) {
    Color yuzderenk(){
      if(double.parse(coinlistesi[index]['price_change_percentage_24h'].toString())<0){
        return Colors.red;
      }else{
        return Colors.green;
      }
    }
    return Card(color: Colors.white ,child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(backgroundImage: NetworkImage("${coinlistesi[index]['image'].toString()}"),),
                SizedBox(width: 20.0,),
                Text("${coinlistesi[index]['name'].toString().toUpperCase()}", style: TextStyle(color: Colors.blue)),


              ]),
          Row(mainAxisAlignment: MainAxisAlignment.start ,children: [
            Text(textAlign: TextAlign.center,"${coinlistesi[index]['current_price'].toString().toUpperCase()}", style: TextStyle(color: Colors.blue),),
            SizedBox(width:10.0 ,),
            Container(padding: EdgeInsets.all(5.0),decoration: BoxDecoration(color: yuzderenk()),child: Text("% ${coinlistesi[index]['price_change_percentage_24h'].toString().toUpperCase()}", style: TextStyle(color: Colors.white),)),

          ],)
        ],
      ),
    ),);
  },)

  );

}

