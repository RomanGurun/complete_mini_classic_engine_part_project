import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterecommerceapp/Views/category_items.dart';
import 'package:flutterecommerceapp/Views/items_detail_screen.dart';
import 'package:flutterecommerceapp/Wigdets/curated_items.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutterecommerceapp/Wigdets/banner.dart';
import '../Models/category_model.dart';
import '../Models/model.dart';
import 'package:flutterecommerceapp/Views/items_detail_screen.dart';
class AppHomeScreen extends ConsumerStatefulWidget{

  const AppHomeScreen({super.key});

  @override
  ConsumerState<AppHomeScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends ConsumerState<AppHomeScreen>{

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(

        child: Column(

          children: [
            SizedBox(height: 30,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Image.asset(""
                  "assets/logo.webp",
              height: 40,),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    Iconsax.shopping_bag,
                    size:28,
                    
                  ),
                  Positioned(
                      right: -3,
                      top:-5,
                      child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,

                    ),
                    child: Center(
                      child: Text(
                        "3",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),

                  )),

                ],
              )
            ],),
            ),
            SizedBox(height: 20,),
          MyBanner(),
Padding(
  padding: EdgeInsets.symmetric(horizontal:20,
  vertical: 18),
  child: Row(
    // create a space between a child widgets

    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Shop By Category",
      style: TextStyle(
        fontSize: 16,
        letterSpacing: 0,
        color:Colors.black87,
        fontWeight: FontWeight.w600,

      ),),
      Text("See All",style:  TextStyle(
        fontSize: 16,
      letterSpacing: 0,
        color:Colors.black45,

      ),),


    ],
  ),
),

          // for Category
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(category.length,(index)=>
                InkWell(
                  onTap: (){

                    // filter products based on the slected category


                    final filterItems = fashionEcommerceApp
                        .where((item)=>
                    item.category.toLowerCase() ==
                    category[index].name.toLowerCase())
                        .toList();

                  //   Navigate to the categoryItems screen with

                    Navigator.push(context,MaterialPageRoute(
                      builder: (_) =>
                          CategoryItems(category: category[index].name, categoryItems:
                          filterItems)
                    ),
                    );



                  },

                  child: Column(
                    children: [
                      Container(
                        padding:const EdgeInsets.symmetric(horizontal: 16),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                            category[index].image,

                          ),
                        ),

                      ),
                      const SizedBox(height: 10,),
                      Text(category[index].name),
                    ],
                  ),


                ),

                ),
              ),
            ),


            Padding(
              padding: EdgeInsets.symmetric(horizontal:20,
                  vertical: 18),
              child: Row(
                // create a space between a child widgets

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Curated For You",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0,
                      color:Colors.black87,
                      fontWeight: FontWeight.w600,

                    ),),
                  Text("See All",style:  TextStyle(
                    fontSize: 16,
                    letterSpacing: 0,
                    color:Colors.black45,

                  ),),


                ],
              ),
            ),
          // for Curated items
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,

   child: Row(
     children: List.generate(
       fashionEcommerceApp.length,
         (index){
         final eCommerceItems = fashionEcommerceApp[index];


         return Padding(padding:
         index == 0 ? EdgeInsets.symmetric(horizontal: 20):
         EdgeInsets.only(right:20),
           child: InkWell(
             onTap:(){
               Future.delayed(Duration(milliseconds: 120),(){
                 if(!mounted) return;
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (_)=>
                         ItemsDetailScreen(
                           eCommerceApp:eCommerceItems,
                         ),
                     ),
                   );

               });



               },
             child:CuratedItems(size:size, eCommerceItems: eCommerceItems) ,
           ),


         );
         }),
            ),
            ),




          ],
        ),
      ),

    );
  }
}