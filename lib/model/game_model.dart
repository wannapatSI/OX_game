// Import the firebase_core and cloud_firestore plugin

import 'package:cloud_firestore/cloud_firestore.dart';

class Match {
  final String? matchID;
  final String gameMode;
  final String gameGrid;
  final String theWinner;
  final int numRound;
  final int numDraw;
  final int numScoreO;
  final int numScoreX;
  final List<String> displayLastGame;

  Match(
      {this.matchID,
      required this.gameMode,
      required this.gameGrid,
      required this.theWinner,
      required this.numRound,
      required this.numDraw,
      required this.numScoreO,
      required this.numScoreX,
      required this.displayLastGame});

  Map<String, dynamic> toMap() {
    return {
      'The Winner is': theWinner,
      'End in Round': numRound,
      'Mode': gameMode,
      'Grid': gameGrid,
      'Draw Round': numDraw,
      'Score O': numScoreO,
      'Score X': numScoreX,
      'DisplayOX': displayLastGame
    };
  }

  Match.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> matchMap)
      : matchID = matchMap.id,
        theWinner = matchMap.data()!['The Winner is'],
        numRound = matchMap.data()!['End in Round'],
        gameMode = matchMap.data()!['Mode'],
        gameGrid = matchMap.data()!['Grid'],
        numDraw = matchMap.data()!['Draw Round'],
        numScoreO = matchMap.data()!['Score O'],
        numScoreX = matchMap.data()!['Score X'],
        displayLastGame = matchMap.data()?['DisplayOX'] == null
            ? null
            : matchMap.data()?['DisplayOX'].cast<String>();

  factory Match.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> matchDoc) {
    final data = matchDoc.data();
    return Match(
        matchID: matchDoc.id,
        gameMode: data!["Mode"],
        gameGrid: data["Grid"],
        theWinner: data["The Winner is"],
        numRound: data["End in Round"],
        numDraw: data["Draw Round"],
        numScoreO: data["Score O"],
        numScoreX: data["Score X"],
        displayLastGame: data["DisplayOX"]);
  }
}
