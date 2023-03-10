import 'package:consultant_app/repositories/Admin/Users/all_users.dart';
import 'package:consultant_app/repositories/Admin/Users/create_user.dart';
import 'package:consultant_app/controllers/categoriy_contoller.dart';
import 'package:consultant_app/views/categoriy_screen.dart';
import 'package:consultant_app/view/auth/LoginScreen.dart';
import 'package:consultant_app/view/details/DetailsScreen.dart';
import 'package:consultant_app/view/details/DetailsVM.dart';
import 'package:consultant_app/view/home/HomeScreen.dart';
import 'package:consultant_app/view/home/HomeVM.dart';
import 'package:consultant_app/view/splach/SplashScreen.dart';
import 'package:consultant_app/view/tag/TagScreen.dart';
import 'package:consultant_app/view/tag/TagVM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'controllers/statuscontroller.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final applicationDocDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(applicationDocDir.path);
  await Hive.openBox("myBox");
  //
  runApp(
    MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (_) => ProviderStatus()),

        ChangeNotifierProvider(create: (_) => ProviderTags()),
        ChangeNotifierProvider(create:(_)=>ProviderCategoriy()),
        ChangeNotifierProvider(create: (_) => HomeVM()),
        ChangeNotifierProvider(create: (_) => DetailsVM()),

      ],
      child: MyApp(),
    ),
  );

  // await InboxApi().createInbox("ttt","ghghg",1,"kjkjk",(DateTime.now()).toString(),"hjhj",2,"","","");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Box box = Hive.box("myBox");
    //print(box.get("roro"));
    // print(box.get("token"));
    // print(box.get("isLoggedIn"));

   return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'RA app',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            '/': (context) => SplashScreen(),
            // When navigating to the "/second" route, build the SecondScreen widget.
            '/Home': (context) => HomeScreen(),
            '/Login': (context) => LoginScreen(),
            '/Details': (context) => DetailsScreen(),
            '/Status': (context) => StatusScreen(),
            '/Admin/CreateUser':(context) => CreateUser(),
            '/Admin/Users':(context)=>AllUsers(),
            '/Category':(context)=> CategoriyScreen(),
            '/Tags': (context) => TagScreen(),
          },





    );

});}}
