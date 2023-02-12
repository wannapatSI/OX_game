//import 'dart:html';

import "package:flutter/material.dart";
import 'package:flutter_tic_tac_toe/page/page_screen_game.dart';
import 'package:flutter_tic_tac_toe/custom_buttons/bottons_mode.dart';
import 'package:flutter_tic_tac_toe/custom_buttons/buttons_grid.dart';

class page_CustomGame extends StatelessWidget {
  static String routeName = '/customgame';
  const page_CustomGame({super.key});
  void screenGame(BuildContext context) {
    Navigator.pushNamed(context, page_ScreenGame.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SETTINGS',
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
        padding: const EdgeInsets.only(top: 30, bottom: 30),
        child: Center(
          child: Column(
            children: [
              //Mode header
              const Text(
                'GAME MODE',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontFamily: 'Goose',
                ),
              ),
              const SizedBox(height: 10),
              //mode
              const bottons_mode(),
              const SizedBox(height: 30),
              //Grid header
              const Text(
                'CHOOSE A GRID',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontFamily: 'Goose',
                ),
              ),
              //Grid
              const SizedBox(height: 10),
              const buttons_grid(),
              //button
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () => screenGame(context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    color: Colors.white,
                    child: const Text(
                      'START GAME',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Mom',
                        letterSpacing: 1,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
