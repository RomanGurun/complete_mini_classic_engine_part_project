import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterecommerceapp/Views/Colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutterecommerceapp/Views/app_home_screen.dart';
import 'package:flutterecommerceapp/Wigdets/banner.dart';
class MyBanner extends ConsumerStatefulWidget{

  const MyBanner({super.key});

  @override
  ConsumerState<MyBanner> createState() => _BannerScreenState();
}

class _BannerScreenState extends ConsumerState<MyBanner>{


  @override
  Widget build(BuildContext context){

    Size size = MediaQuery.of(context).size;


    return Container(
      height: size.height * 0.23,
      width:  size.width,
      color:bannerColor,
      padding: EdgeInsets.only(left:27),
      child: Stack(
        children:[
          Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            mainAxisAlignment: MainAxisAlignment.center,


            children: [
              Text("NEW COLLECTIONS",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: -2,

              ),
              ),
              Row(
                children: [
                  Text("20",
                  style: TextStyle(
                    fontSize: 40,
                    height: 0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -3,

                  ),),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("%",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,

                      ),),
                      Text("OFF",
                      style: TextStyle(
                        fontSize: 10,
                        letterSpacing: -1.5,
                        fontWeight: FontWeight.bold,
                        height: 0.6,

                      ),)


                    ],
                  )



                ],
              ),
              MaterialButton(onPressed: (){

              },

              color:Colors.black12,
                child:Text("SHOP NOW",style:
                  TextStyle(color:Colors.white,
                  fontSize: 12,

                  ),)
              ),




            ],
          ),

          Align(alignment: Alignment.bottomRight,
          child: Image.asset("assets/advertise.jpg",

          height: size.height * 0.18,
          ),
          ),
        ]
      ),
    );
  }
}