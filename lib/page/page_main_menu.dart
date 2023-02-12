import 'dart:ui';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/page/page_custom_game.dart';
import 'package:flutter_tic_tac_toe/page/page_history_game.dart';
import 'package:flutter_tic_tac_toe/responsive/responsive.dart';

class page_MainMenu extends StatelessWidget {
  static String routeName = '/mainmenu';
  const page_MainMenu({super.key});

  void customGame(BuildContext context) {
    Navigator.pushNamed(context, page_CustomGame.routeName);
  }

  void historyGame(BuildContext context) {
    Navigator.pushNamed(context, page_HistoryGame.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, bottom: 80),
        child: Center(
          child: Column(
            children: [
              //header
              const Text(
                'TIC TAC TOE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 65,
                  color: Colors.white,
                  fontFamily: "Trench",
                  fontWeight: FontWeight.w900,
                ),
              ),

              //Image
              Expanded(
                flex: 2,
                child: AvatarGlow(
                  endRadius: 140,
                  glowColor: Colors.white,
                  duration: Duration(milliseconds: 2000),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: Duration(milliseconds: 100),
                  child: Material(
                    shape: const CircleBorder(),
                    child: CircleAvatar(
                      radius: 60,
                      child: Image.asset(
                        "image/image_game.png",
                        height: 120,
                      ),
                    ),
                  ),
                ),
              ),

              //Button1,2
              Column(
                children: [
                  GestureDetector(
                    onTap: () => customGame(context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        color: Colors.white,
                        child: const Text(
                          'PLAY GAME',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Mom',
                            letterSpacing: 0,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => historyGame(context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        color: Colors.white,
                        child: const Text(
                          'REPLAY GAME',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Mom',
                            letterSpacing: 0,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
