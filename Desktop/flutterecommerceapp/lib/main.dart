import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterecommerceapp/Views/app_main_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(ProviderScope(

    child: const MyApp()
  ));

}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppMainScreen(),
    );

  }

}