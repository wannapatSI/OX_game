import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/page/screen_game/multiple_mode/5x5_mul_grid.dart';
import 'package:flutter_tic_tac_toe/static_variable.dart';
import 'package:flutter_tic_tac_toe/page/screen_game/single_mode/3x3_sin_grid.dart';

import 'screen_game/multiple_mode/3x3_mul_grid.dart';
import 'screen_game/multiple_mode/7x7_mul_grid.dart';
import 'screen_game/single_mode/5x5_sin_grid.dart';
import 'screen_game/single_mode/7x7_sin_grid.dart';

class page_ScreenGame extends StatefulWidget {
  static String routeName = '/screengame';
  const page_ScreenGame({super.key});
  void single3x3(BuildContext context) {
    Navigator.pushNamed(context, single_3x3.routeName);
  }

  @override
  State<page_ScreenGame> createState() => _page_ScreenGameState();
}

class _page_ScreenGameState extends State<page_ScreenGame> {
  int mode = StaticVariable.mode;
  int grid = StaticVariable.grid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BACK',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'Trench',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromRGBO(16, 13, 30, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Center(
          child: Expanded(
            child: Column(children: [
              //condition gamescreen
              if (mode == 0) ...{
                if (grid == 0) ...{
                  const single_3x3(),
                } else if (grid == 1) ...{
                  const single_5x5(),
                } else ...{
                  const single_7x7(),
                }
              } else ...{
                if (grid == 0) ...{
                  const multiple_3x3(),
                } else if (grid == 1) ...{
                  const multiple_5x5(),
                } else ...{
                  const multiple_7x7(),
                }
              },
            ]),
          ),
        ),
      ),
    );
  }
}
