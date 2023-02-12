import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/page/screen_game/single_mode/3x3_sin_grid.dart';
import 'package:flutter_tic_tac_toe/static_variable.dart';

class buttons_grid extends StatefulWidget {
  const buttons_grid({super.key});

  @override
  State<buttons_grid> createState() => _buttons_gridState();
}

class _buttons_gridState extends State<buttons_grid> {
  List<bool> isSelected = [true, false, false];
  List imageList = [
    Image.asset(
      'image/3x3_Square_Grid.png',
      height: 130,
    ),
    Image.asset(
      'image/5x5_Square_Grid.png',
      height: 130,
    ),
    Image.asset(
      'image/7x7_Square_Grid.png',
      height: 130,
    ),
  ];
  int value_grid = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GestureDetector(
            child: ToggleButtons(
              isSelected: isSelected,
              selectedColor: Colors.white,
              fillColor: Colors.red.shade900,
              renderBorder: false,
              onPressed: ((int newTndex) {
                setState(() {
                  for (int index = 0; index < isSelected.length; index++) {
                    if (index == newTndex) {
                      isSelected[index] = true;
                      value_grid = index;
                      StaticVariable.grid = value_grid;
                    } else {
                      isSelected[index] = false;
                    }
                  }
                });
              }),
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text('3x3',
                      style: TextStyle(fontSize: 22, fontFamily: 'Mom')),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text('5x5',
                      style: TextStyle(fontSize: 22, fontFamily: 'Mom')),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text('7x7',
                      style: TextStyle(fontSize: 22, fontFamily: 'Mom')),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        imageList[value_grid],
      ]),
    );
  }
}
