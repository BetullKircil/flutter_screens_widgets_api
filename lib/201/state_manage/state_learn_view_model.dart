import 'package:flutter/material.dart';
import 'package:flutter_deneme_somestr/201/state_manage/state_manage_learn.dart';

abstract class StateLearnViewModel extends State<StateManageLern> {
  @override
  void initState() {
    super.initState();
  }

  bool isVisible = true;
  bool isOpacity = false;
  //bazen 0'lar icin (cok kullanılıyorsa) degiskenleri  bu sekilde set edebiliriz

  void changeVisible() {
    isVisible = !isVisible;
  }

  void changeOpacity() {
    isOpacity = !isOpacity;
  }
}
