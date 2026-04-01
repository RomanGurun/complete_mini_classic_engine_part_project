// ======================= RC ROLLBACK MAIN FUnction CODE ==================================

import 'package:engine_frontends/features/exit_page/screens/exit_form_screen.dart';
// import 'package:engine_frontends/features/rc_rollback/screens/rc_customer_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(home: child, debugShowCheckedModeBanner: false);
      },
      child:ExitFormScreen(),
      // child: RcCustomerDetailsScreen(),
    );
  }
}


// ======================= RC ROLLBACK MAIN FUnction CODE ==================================