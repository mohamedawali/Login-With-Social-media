import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_social_media/route.dart';
import 'package:login_social_media/translations/codegen_loader.g.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await EasyLocalization.ensureInitialized();
  runApp( EasyLocalization(supportedLocales:[Locale("en"),Locale("ar")],path:"assets/translations/" ,fallbackLocale: Locale("en"),assetLoader: CodegenLoader(),child: MyApp(appRouter: AppRouter(),)));
}

class MyApp extends StatelessWidget {
  AppRouter appRouter;
   MyApp({Key? key,required this.appRouter}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
onGenerateRoute:appRouter.router,
      localizationsDelegates: context.localizationDelegates,
     supportedLocales: context.supportedLocales,
      locale: context.locale,

      title: 'Flutter Demo',
      theme: ThemeData(
fontFamily: "fontkey",

        primarySwatch: Colors.blue,
      ),

    );
  }
}
