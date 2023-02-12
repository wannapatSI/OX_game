import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/static_variable.dart';

class bottons_mode extends StatefulWidget {
  const bottons_mode({super.key});

  @override
  State<bottons_mode> createState() => _bottons_modeState();
}

class _bottons_modeState extends State<bottons_mode> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
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
                  StaticVariable.mode = index;
                } else {
                  isSelected[index] = false;
                }
              }
            });
          }),
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text('Single Mode',
                  style: TextStyle(fontSize: 22, fontFamily: 'Mom')),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text('Multiple Mode',
                  style: TextStyle(fontSize: 22, fontFamily: 'Mom')),
            ),
          ],
        ),
      ),
    );
  }
}
