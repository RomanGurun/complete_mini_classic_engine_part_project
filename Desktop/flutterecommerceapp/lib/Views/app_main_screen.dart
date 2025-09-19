import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutterecommerceapp/Views/app_home_screen.dart';

class AppMainScreen extends ConsumerStatefulWidget{

  const AppMainScreen({super.key});

  @override
  ConsumerState<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends ConsumerState<AppMainScreen>{

  int selecetedIndex =0;
  final List pages = [
    const AppHomeScreen(),
    // const AppHomeScreen(),

    const Scaffold(),
    const Scaffold(),
    const Scaffold(),



  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.black,
        type:BottomNavigationBarType.fixed,
       currentIndex: selecetedIndex,
        onTap:(value){
          setState((){

          });

selecetedIndex = value;
        },
        elevation: 0,
        backgroundColor: Colors.white,
        items:const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home),label :"Home"),
          BottomNavigationBarItem(icon: Icon(Iconsax.search_normal),label :"Search"),
       BottomNavigationBarItem(icon: Icon(Iconsax.notification),label:"Notification"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline),label:"Notification"),

        ],
      ),
      body: pages[selecetedIndex],
    );
  }
}