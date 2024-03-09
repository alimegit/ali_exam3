
import 'package:alisher_exam3/data/local/storage_repository.dart';
import 'package:alisher_exam3/routes.dart';
import 'package:alisher_exam3/tab_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.init();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812,),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: false),
          initialRoute: RouteNames.tabBox,
          onGenerateRoute: AppRoute.generateRoute,
          home: child,
        );
      },
      child: const TabBox(),
    );
  }
}