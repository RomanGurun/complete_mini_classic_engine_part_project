// import 'package:ecommerceapi/pages/home_page.dart';
// import 'package:ecommerceapi/pages/home_page.dart';
// import 'package:ecommerceapi/routes/route_enum.dart';
// import 'package:go_router/go_router.dart';
// import 'package:ecommerceapi/pages/meal_page.dart';
// import 'package:ecommerceapi/pages/suggestion_page.dart';
// import 'package:ecommerceapi/pages/user_page.dart';
//
//
// final router = GoRouter(
//     routes:[
//       GoRoute(
//         path: '/',
//         builder: (context,state){
//           return HomePage();
//
//         },
//         // routes: [
//         //   GoRoute(path: '/meal-page',
//         //   name:AppRoute.meal.name,
//         //     builder: (context,stateok){
//         //     return MealPage(title: stateok.extra as String);
//         //     }
//         //   )
//         // ]
//         //
//
//       ),
//       GoRoute(
//           path: '/meal-page',
//           name:AppRoute.meal.name,
//           builder: (context,stateok){
//             return MealPage(title: stateok.extra as String);
//           }
//       ),
//
//
//
//       GoRoute(
//           path:'/suggestionpage',
//           name:AppRoute.ecommerce.name,
//           builder:(context,state){
//             return SuggestionPage();
//           }
//       ),
//
//       GoRoute(
//           path:'/userpage',
//           name:AppRoute.userpage.name,
//           builder: (context,state){
//             return UserPage();
//           }
//       ),
//
//     ]
// );