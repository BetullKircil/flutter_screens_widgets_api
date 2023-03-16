import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deneme_somestr/101/Image_Learn.dart';
import 'package:flutter_deneme_somestr/101/appBar_learn.dart';
import 'package:flutter_deneme_somestr/101/button_learn.dart';
import 'package:flutter_deneme_somestr/101/card_leaarn.dart';
import 'package:flutter_deneme_somestr/101/color_learn.dart';
import 'package:flutter_deneme_somestr/101/column_row_learn.dart';
import 'package:flutter_deneme_somestr/101/container_sized_box_learn.dart';
import 'package:flutter_deneme_somestr/101/custom_widget_learn.dart';
import 'package:flutter_deneme_somestr/101/icon_learn.dart';
import 'package:flutter_deneme_somestr/101/indicator_learn.dart';
import 'package:flutter_deneme_somestr/101/listTileLearn.dart';
import 'package:flutter_deneme_somestr/101/list_view_learn.dart';
import 'package:flutter_deneme_somestr/101/listview_builder_learn.dart';
import 'package:flutter_deneme_somestr/101/navigation_learn.dart';
import 'package:flutter_deneme_somestr/101/padding_learn.dart';
import 'package:flutter_deneme_somestr/101/page_view_learn.dart';
import 'package:flutter_deneme_somestr/101/scaffold_learn.dart';
import 'package:flutter_deneme_somestr/101/stack_learn.dart';
import 'package:flutter_deneme_somestr/101/statefull_learn.dart';
import 'package:flutter_deneme_somestr/101/statefull_life_cycle.dart';
import 'package:flutter_deneme_somestr/101/stateless_widget_lear.dart';
import 'package:flutter_deneme_somestr/101/textfields_learn.dart';
import 'package:flutter_deneme_somestr/201/animated_learn.dart';
import 'package:flutter_deneme_somestr/201/cache/shared_preferences_learn.dart';
import 'package:flutter_deneme_somestr/201/cache/user_cache/shared_list_cache.dart';
import 'package:flutter_deneme_somestr/201/form_learn_view.dart';
import 'package:flutter_deneme_somestr/201/image_learn_mid.dart';
import 'package:flutter_deneme_somestr/201/oop_learn_view.dart';
import 'package:flutter_deneme_somestr/201/package_learn_view.dart';
import 'package:flutter_deneme_somestr/201/password_textfield_learn.dart';
import 'package:flutter_deneme_somestr/201/service/service_learn_view.dart';
import 'package:flutter_deneme_somestr/201/service/service_post_learn.dart';
import 'package:flutter_deneme_somestr/201/sheet_learn.dart';
import 'package:flutter_deneme_somestr/201/tabbar_learn.dart';
import 'package:flutter_deneme_somestr/201/theme/light_theme.dart';
import 'package:flutter_deneme_somestr/demos/color_change_demos.dart';
import 'package:flutter_deneme_somestr/demos/color_change_lifecycle.dart';
import 'package:flutter_deneme_somestr/demos/color_demos_view.dart';
import 'package:flutter_deneme_somestr/demos/color_lifecycle_view.dart';
import 'package:flutter_deneme_somestr/demos/my_collections_demo.dart';
import 'package:flutter_deneme_somestr/demos/note_demos.dart';
import 'package:flutter_deneme_somestr/demos/note_demos2.dart';
import 'package:flutter_deneme_somestr/demos/stack_demo_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static ProjectIconColors iconColors = ProjectIconColors();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: LightTheme().theme,
      // theme: ThemeData.dark().copyWith(
      //     tabBarTheme: TabBarTheme(
      //         labelColor: Colors.white, unselectedLabelColor: Colors.red),
      //     textSelectionTheme: TextSelectionThemeData(
      //         selectionColor: Colors.amber,
      //         cursorColor: Colors.red,
      //         selectionHandleColor: Colors.green),
      //     iconTheme: IconThemeData(color: Colors.pink, opacity: 1),
      //     inputDecorationTheme: InputDecorationTheme(
      //         border: OutlineInputBorder(),
      //         filled: true,
      //         iconColor: Colors.blue,
      //         fillColor: Colors.white,
      //         labelStyle:
      //             TextStyle(color: Colors.black, fontStyle: FontStyle.normal)),
      //     listTileTheme: ListTileThemeData(
      //         contentPadding: EdgeInsets.zero,
      //         //dense: true,
      //         iconColor: iconColors.iconColor,
      //         shape: RoundedRectangleBorder(),
      //         selectedTileColor: Colors.red),
      //     bottomAppBarTheme: BottomAppBarTheme(color: Colors.transparent),
      //     progressIndicatorTheme:
      //         ProgressIndicatorThemeData(color: Colors.black),
      //     scaffoldBackgroundColor: Color.fromARGB(255, 240, 239, 239),
      //     cardTheme: CardTheme(
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(20))),
      //     errorColor: ColorsItems().mapkin,
      //     appBarTheme: AppBarTheme(
      //         centerTitle: true,
      //         toolbarHeight: 30,
      //         systemOverlayStyle: SystemUiOverlayStyle.light,
      //         iconTheme:
      //             IconTheme.of(context).copyWith(color: iconColors.iconColor),
      //         backgroundColor: Colors.transparent,
      //         elevation: 0,
      //         titleTextStyle: Theme.of(context).textTheme.headline4?.copyWith(
      //             fontStyle: FontStyle.italic, color: ProjectColors.color))),
      home: SheetLearn(),
    );
  }
}
