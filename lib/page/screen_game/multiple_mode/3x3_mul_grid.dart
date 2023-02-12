import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/model/check_winner.dart';
import 'package:flutter_tic_tac_toe/model/database_service.dart';
import 'package:flutter_tic_tac_toe/model/game_model.dart';
import 'package:flutter_tic_tac_toe/static_variable.dart';
import '../../../model/check_for_draw.dart';

class multiple_3x3 extends StatefulWidget {
  static String routeName = '/multiple3x3';
  const multiple_3x3({super.key});

  @override
  State<multiple_3x3> createState() => _multiple_3x3State();
}

class _multiple_3x3State extends State<multiple_3x3> {
  String player_X = StaticVariable.player_X;
  String player_O = StaticVariable.player_O;
  late String currentPlayer;
  late bool gameEnd;
  late List<String> displayXO;
  late int score_X;
  late int score_O;
  late int score_Draw;
  late int round;
  String mode = 'Multiple Mode';
  String grid = '3x3';
  DatabaseService service = DatabaseService();

  @override
  void initState() {
    initializeGame();
    super.initState();
  }

  void initializeGame() {
    currentPlayer = player_O;
    gameEnd = false;
    displayXO = ['', '', '', '', '', '', '', '', ''];
    score_X = 0;
    score_O = 0;
    score_Draw = 0;
    round = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
          body: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Column(children: [
                  //icon_settings_to_custom_game
                  //header
                  _headerText(),
                  _gameContainer(),
                ]),
              ))),
    );
  }

  Widget _headerText() {
    return Column(children: [
      //icon_settings_to_custom_game
      //header
      const Text(
        'SCORE BOARDS',
        style: TextStyle(
          fontSize: 50,
          color: Colors.white,
          fontFamily: 'Mom',
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: const [
              Text(
                'PLAYER',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Mom',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'O',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontFamily: 'Goose',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            '$score_O',
            style: const TextStyle(
              fontSize: 25,
              color: Colors.blue,
              fontFamily: 'Mom',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            '  :  ',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'Mom',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '$score_X',
            style: const TextStyle(
              fontSize: 25,
              color: Colors.blue,
              fontFamily: 'Mom',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            children: const [
              Text(
                'PLAYER',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Mom',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'X',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontFamily: 'Goose',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
      Text(
        "Now, $currentPlayer turn",
        style: const TextStyle(
          fontSize: 22,
          color: Colors.red,
          fontFamily: 'Mom',
          fontWeight: FontWeight.bold,
        ),
      )
    ]);
  }

  Widget _gameContainer() {
    return SingleChildScrollView(
      child: Container(
          margin: const EdgeInsets.all(30),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, int index) {
                return _box(index);
              })),
    );
  }

  Widget _box(int index) {
    return InkWell(
        onTap: () {
          setState(() {
            if (gameEnd || displayXO[index].isNotEmpty) {
              return;
            }
            StaticVariable.sendDisplay = displayXO;

            displayXO[index] = currentPlayer;
            _changeTurn();

            if (check_winner_3x3(displayXO) == true) {
              gameEnd = true;
              String winner;
              if (currentPlayer == player_O) {
                winner = player_X;
                score_X += 1;
                round += 1;
              } else {
                winner = player_O;
                score_O += 1;
                round += 1;
              }

              if (score_O == 3 || score_X == 3) {
                StaticVariable.score_O = score_O;
                StaticVariable.score_X = score_X;
                StaticVariable.score_Draw = score_Draw;
                service.addMatch(Match(
                    numRound: round,
                    numDraw: score_Draw,
                    theWinner: winner,
                    gameGrid: grid,
                    gameMode: mode,
                    numScoreO: score_O,
                    numScoreX: score_X,
                    displayLastGame: displayXO));
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Color.fromRGBO(229, 229, 234, 1),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32))),
                        title: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Text(
                                '$winner player',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 28,
                                  color: Colors.red,
                                  fontFamily: 'Mom',
                                ),
                              ),
                              const Text(
                                'Win!!!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.black,
                                  fontFamily: 'Mom',
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          CupertinoDialogAction(
                              onPressed: (() {
                                _resetRound();
                                Navigator.pop(context);
                              }),
                              child: const Text(
                                'Play Again',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: 'Mom',
                                ),
                              )),
                          CupertinoDialogAction(
                              onPressed: () {
                                Navigator.pushNamed(context, '/mainmenu');
                              },
                              child: const Text(
                                'Main Menu',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: 'Mom',
                                ),
                              )),
                        ],
                      );
                    });
              } else {
                _autoClearBoard();
              }
            }
            if (check_for_draw(displayXO, gameEnd) == true) {
              gameEnd = true;
              score_Draw += 1;
              round += 1;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      'Draw',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontFamily: 'Mom',
                      ),
                    )),
              );
              _autoClearBoard();
            }
          });
        },
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 5,
              ),
              color: Colors.white,
            ),
            child: Center(
                child: Text(
              displayXO[index],
              style: const TextStyle(
                fontSize: 75,
                color: Colors.black,
                fontFamily: 'Goose',
              ),
            )),
          ),
        ));
  }

  _changeTurn() {
    if (currentPlayer == StaticVariable.player_O) {
      currentPlayer = StaticVariable.player_X;
    } else {
      currentPlayer = StaticVariable.player_O;
    }
  }

  void _autoClearBoard() {
    setState(() {
      for (int i = 0; i < displayXO.length; i++) {
        displayXO[i] = '';
        gameEnd = false;
      }
    });
  }

  _resetRound() {
    setState(() {
      initializeGame();
    });
  }
}
