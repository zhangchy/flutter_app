import 'package:flutter/material.dart';

class TabIndexStore with ChangeNotifier{
  int currentIndex=0;
  
  changeIndex(int newIndex){
    currentIndex=newIndex;
    notifyListeners();
  }

}