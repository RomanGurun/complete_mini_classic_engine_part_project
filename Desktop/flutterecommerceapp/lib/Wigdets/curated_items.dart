import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterecommerceapp/Views/Colors.dart';

import '../Models/model.dart';
class CuratedItems extends ConsumerStatefulWidget{

  final AppModel eCommerceItems;
  final Size size;


  const CuratedItems( {super.key,required this.eCommerceItems,
  required this.size
  });

  @override
  ConsumerState<CuratedItems> createState() => _CuratedScreenState();
}

class _CuratedScreenState extends ConsumerState<CuratedItems> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
       Hero(
         tag:widget.eCommerceItems.image,

         child: Container(
           decoration:BoxDecoration(
               borderRadius:BorderRadius.circular(8),
               color:fbackgroundColor2,
               image:DecorationImage(
                 image:AssetImage(widget.eCommerceItems.image),
                 //   i have use widget . because  widget. inside a State (or ConsumerState) because the values are defined in the widget class (CuratedItems), not in the state class (_CuratedScreenState).
                 fit: BoxFit.cover,



               )

           ),

           height: widget.size.height *0.25,
           width:  widget.size.width*0.5,
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
            Text(widget.eCommerceItems.rating.toString()),
Text(" (${widget.eCommerceItems.review})",
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
              width: widget.size.width * 0.5,
              child :Text( widget.eCommerceItems.name,
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
                Text("\$ ${widget.eCommerceItems.price.toString()}.00",
                  style: TextStyle(fontWeight:FontWeight.w600,
                      fontSize: 18,
                      color: Colors.pink,
                      height: 1.5
                  ),
                ),

                SizedBox(width: 5,
                ),
                if(widget.eCommerceItems.isCheck == true)
                  Text("\$ ${widget.eCommerceItems.price +255}.00",

                  style: const TextStyle(
                    color:Colors.black26,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.black26,

                  ),

                  )

              ],
            ),


          ],
        );



  }
}