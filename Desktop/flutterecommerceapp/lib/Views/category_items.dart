import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterecommerceapp/Models/category_model.dart';
import 'package:flutterecommerceapp/Views/items_detail_screen.dart';
import 'package:iconsax/iconsax.dart';

import '../Models/category_model.dart';
import '../Models/model.dart';
import '../Models/sub_category.dart';
import 'Colors.dart';

class CategoryItems extends ConsumerStatefulWidget{

  // final AppModel eCommerceApp;
final String category;
final List<AppModel> categoryItems;

  const CategoryItems( {super.key, required this.category,
  required this.categoryItems});


  @override
  ConsumerState<CategoryItems> createState() => _CategoryScreenState();

}
class _CategoryScreenState extends ConsumerState<CategoryItems>{

  int currentIndex =0;
  int selectedColorIndex = 1;
  int selectedSizeIndex = 1;

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;

return Scaffold(
  backgroundColor:  Colors.white,
  body: SafeArea(child: Column(
    children: [
      Padding(padding:
      const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
              children:[
           InkWell(
                  onTap: () {
                    Navigator.pop(context);
      },
  child: const Icon(Icons.arrow_back_ios_new),

),
                const SizedBox(width: 10,),
                Expanded(child: SizedBox(
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(5),

                      hintText: "$widget.category's Fashion",
                      hintStyle: const TextStyle(color:Colors.black38),
                      filled: true,
                      fillColor: fbackgroundColor2,
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon: const Icon(
                        Iconsax.search_normal,
                        color: Colors.black38,
                      ),

                      border:OutlineInputBorder(borderSide: BorderSide.none),


                    ),
                  ),
                ),),
              ]
          )


      ),
SizedBox(height: 20,),
      Padding(padding:
      EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:Row(
        children:
        //  =====   filterCategory is defined under a category_model.dart file =====


        List.generate(filterCategory.length,
            (index)=> Padding(
              padding: const EdgeInsets.only(right:5),
              child: Container(
                padding: EdgeInsets.all(
                  5
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color:Colors.black12),

                ),
child: Row(
  children: [
    Text(filterCategory[index]),
    const SizedBox(width: 5,),
    index == 0
    ? const Icon(Icons.filter_list,
    size: 15,
        )
        : const Icon(
      Icons.keyboard_arrow_down,
      size: 15,
    ),

  ],
),

              ),


            )
        ),
      ),
      ),
      ),
      SizedBox(height: 20,),
      // for Category
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(subcategory.length,(index)=>
              InkWell(
                onTap: (){


                },

                child: Column(
                  children: [
                    Container(
                      padding:const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: fbackgroundColor1,
                          shape: BoxShape.circle,
                          image: DecorationImage(image:
                          AssetImage(subcategory[index].image),
                          ),

                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(subcategory[index].name),
                  ],
                ),


              ),

          ),
        ),
      ),
SizedBox(height: 20,),
      Expanded(
          child: widget.categoryItems.isEmpty ? Center(
        child: Text("No items available in this category.",
        style: TextStyle(
          fontSize: 16,
          color:Colors.red,
        ),


      ),
          )
      :GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemCount: widget.categoryItems.length,
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount :2,
              childAspectRatio:0.6,
              mainAxisSpacing:16,
              crossAxisSpacing:16,

            ),
            itemBuilder: (context,index){

              final item = widget.categoryItems[index];

              return GestureDetector(
                onTap: (){
Navigator.push(
  context,
  MaterialPageRoute(builder: (_) =>
      ItemsDetailScreen(eCommerceApp: item),),

);
                },
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Hero(
                      tag:item.image,

                      child:
                Container(
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(8),
                          color:fbackgroundColor2,
                          image:DecorationImage(
                            image:AssetImage(item.image),
                            //   i have use widget . because  widget. inside a State (or ConsumerState) because the values are defined in the widget class (CuratedItems), not in the state class (_CuratedScreenState).
                            fit: BoxFit.cover,



                          )

                      ),

                      height: size.height *0.25,
                      width:  size.width*0.5,
                      child: const Padding(padding: EdgeInsets.all(12),

                        child: Align(
                            alignment: Alignment.topRight,
                            child:CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.black26,
                              child: Icon(Icons.favorite_border),
                            )
                        ),

                      ),

                    ),
                    ),
                    SizedBox(height: 7,),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        Text("H&M",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color:Colors.black26,

                          ),),
                        SizedBox(width:5),
                        Icon(Icons.star,
                          color:Colors.amber,
                          size: 17,
                        ),
                        Text(item.rating.toString()),
                        Text(" ($item.review})",
                          style:TextStyle(color:Colors.black26
                          ),
                        ),
                      ],
                    ),


//
// SizedBox(
//   width: widget.size.width * 0.5,
//   child :Text( widget.eCommerceItems.name,
//   maxLines: 1,
//   overflow: TextOverflow.ellipsis,
//   style: TextStyle(
//     fontWeight: FontWeight.w600,
//     fontSize: 16,
//     height:1.5,
//   ),
//   ),
// ),
//             Row(
//               children: [
//                 Text("\$ ${widget.eCommerceItems.price.toString()}.00",
//                 style: TextStyle(fontWeight:FontWeight.w600,
//                 fontSize: 18,
//                   height: 1.5
//                 ),
//                 ),
//
// SizedBox(width: 5,
// ),
//
//               ],
//             ),




                    SizedBox(
                      width: size.width * 0.5,
                      child :Text( item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          height:1.5,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text("\$ ${item.price.toString()}.00",
                          style: TextStyle(fontWeight:FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black,
                              height: 1.5
                          ),
                        ),

                        SizedBox(width: 5,
                        ),
                        if(item.isCheck == true)
                          Text("\$ ${item.price +255}.00",

                            style: const TextStyle(
                              color:Colors.black26,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.black26,

                            ),

                          )

                      ],
                    ),


                  ],
                ),


              );
            },
          )
      )



    ],
  )),
);

  }
}