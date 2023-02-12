import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/colors.dart';
import 'package:flutter_tic_tac_toe/page/page_custom_game.dart';
import 'package:flutter_tic_tac_toe/page/page_history_game.dart';
import 'package:flutter_tic_tac_toe/page/page_main_menu.dart';
import 'package:flutter_tic_tac_toe/page/page_screen_game.dart';
import 'package:flutter_tic_tac_toe/page/screen_game/single_mode/3x3_sin_grid.dart';
import 'package:flutter_tic_tac_toe/page/screen_game/single_mode/5x5_sin_grid.dart';
import 'package:flutter_tic_tac_toe/page/screen_game/single_mode/7x7_sin_grid.dart';
import 'package:flutter_tic_tac_toe/page/screen_game/multiple_mode/3x3_mul_grid.dart';
import 'package:flutter_tic_tac_toe/page/screen_game/multiple_mode/5x5_mul_grid.dart';
import 'package:flutter_tic_tac_toe/page/screen_game/multiple_mode/7x7_mul_grid.dart';

import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
      ),
      routes: {
        page_MainMenu.routeName: (context) => const page_MainMenu(),
        page_CustomGame.routeName: (context) => const page_CustomGame(),
        page_HistoryGame.routeName: (context) => const page_HistoryGame(),
        page_ScreenGame.routeName: (context) => const page_ScreenGame(),
        single_3x3.routeName: (context) => const single_3x3(),
        single_5x5.routeName: (context) => const single_5x5(),
        single_7x7.routeName: (context) => const single_7x7(),
        multiple_3x3.routeName: (context) => const multiple_3x3(),
        multiple_5x5.routeName: (context) => const multiple_5x5(),
        multiple_7x7.routeName: (context) => const multiple_7x7(),
      },
      initialRoute: page_MainMenu.routeName,
    );
  }
}
