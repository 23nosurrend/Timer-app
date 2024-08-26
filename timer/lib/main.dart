import 'package:flutter/material.dart';
import 'package:timer/pages/home.dart';
import 'package:timer/pages/loading.dart';
import 'package:timer/pages/choose_location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes:{
    '/':(context)=>Loading(),
    '/home':(context)=> const Home(),
    '/location':(context)=> const ChooseLocation(),
  }
  
  ));
// 