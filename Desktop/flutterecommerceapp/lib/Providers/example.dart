import 'package:flutter/material.dart';
import 'package:ecommerceapi/pages/widgets/category_item.dart';
import 'package:ecommerceapi/providers/categoryprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../routes/route_enum.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final productState = ref.watch(categoryproductprovider);
    return Scaffold(
        body: productState.when(
          data: (data){
            return DefaultTabController(
              length: data.length,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(

                    bottom: TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: data.map((category){
                        return Tab(
                          child:FittedBox(


                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundImage: NetworkImage(category.image),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  category.name,
                                  style: const TextStyle(fontSize: 12),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,

                                ),

                              ],


                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 300,
                      child: TabBarView(
                        children: data.map((category){
                          return CategoryItemPage( category: category.slug);


                        }).toList(),
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            // color: Colors.grey.shade200,
                            child:ListTile(
                              onTap: (){
                                context.pushNamed(AppRoute.ecommerce.name);
                              },
                              leading: Container(
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  // color: Colors.grey.shade200,
                                  child: Text(
                                    "Suggestion Page",
                                    style: TextStyle(
                                      fontSize: 20,            // text size
                                      fontWeight: FontWeight.bold, // bold, w400, w500, etc.
                                      color: Colors.black,      // text color
                                    ),
                                    textAlign: TextAlign.center,   // center, left, right, justify
                                  ),



                                ),
                              ),

                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            // color: Colors.grey.shade200,
                            child:ListTile(
                              onTap: (){
                                context.pushNamed(AppRoute.userpage.name);
                              },
                              leading: Container(
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  // color: Colors.grey.shade200,
                                  child: Text(
                                    "User-Page",
                                    style: TextStyle(
                                      fontSize: 20,            // text size
                                      fontWeight: FontWeight.bold, // bold, w400, w500, etc.
                                      color: Colors.black,      // text color
                                    ),
                                    textAlign: TextAlign.center,   // center, left, right, justify
                                  ),


                                ),
                              ),

                            ),
                          ),



                        ],
                      )

                  ),
                ],
              ),

            );

          },
          error: (err, st){
            return Text(err.toString());
          },
          loading: () => const Center(child: CircularProgressIndicator(),
          ),
        ));
  }
}