import 'dart:convert';
import 'design.dart';

import 'main.dart';
import 'package:flutter/material.dart';



SafeArea controller(int indeximiz){
  if(indeximiz==0){
    return HousePage(haberlistesi);
  }else if(indeximiz==1){
    return MarketPageSafeArea(coinlistesi);
  }else if(indeximiz==2){
    return TrendPage(trendcoinlist);

  }else{
    return SettingPage();}
}










SafeArea MarketPageSafeArea(List coinlistesi){
  return SafeArea(child: MarketPageDesign(coinlistesi));
}



// .............................................................................. Page Ayrımı........................................................
SafeArea HousePage(List haberlistesi){

  return SafeArea(child: HousePageDesign(haberlistesi));

}


// .............................................................................. Page Ayrımı........................................................

SafeArea TrendPage(List trendcoinlist){
  return SafeArea(child: TrendPageDesign(trendcoinlist));
}





// .............................................................................. Page Ayrımı........................................................

SafeArea SettingPage(){
  return SafeArea(child: Container(child: Text("SettingPage"),));
}