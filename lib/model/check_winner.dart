import 'package:flutter/material.dart';

dynamic check_winner_3x3(List displayGamae) {
  List<List<int>> winningList = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  for (var winningPos in winningList) {
    String playerPosition0 = displayGamae[winningPos[0]];
    String playerPosition1 = displayGamae[winningPos[1]];
    String playerPosition2 = displayGamae[winningPos[2]];

    if (playerPosition0.isNotEmpty) {
      if (playerPosition0 == playerPosition1 &&
          playerPosition0 == playerPosition2) {
        return true;
      }
    }
  }
}

dynamic check_winner_5x5(List displayGamae) {
  List<List<int>> winningList = [
    [0, 1, 2, 3, 4], //row1
    [5, 6, 7, 8, 9], //row2
    [10, 11, 12, 13, 14], //row3
    [15, 16, 17, 18, 19], //row4
    [20, 21, 22, 23, 24], //row5

    [0, 5, 10, 15, 20], //col1
    [1, 6, 11, 16, 21], //col2
    [2, 7, 12, 17, 22], //col3
    [3, 8, 13, 18, 23], //col4
    [4, 9, 14, 19, 24], //col5

    [0, 6, 12, 18, 24], //dia_L1
    [1, 7, 13, 19], //dia_L2
    [5, 11, 17, 23], //dia_L3

    [3, 7, 11, 15], //dia_R1
    [4, 8, 12, 16, 20], //dia_R2
    [9, 13, 17, 21], //dia_R3
  ];

  for (var winningPos in winningList) {
    String playerPosition0 = displayGamae[winningPos[0]];
    String playerPosition1 = displayGamae[winningPos[1]];
    String playerPosition2 = displayGamae[winningPos[2]];
    String playerPosition3 = displayGamae[winningPos[3]];

    if (playerPosition0.isNotEmpty) {
      if (playerPosition0 == playerPosition1 &&
          playerPosition0 == playerPosition2 &&
          playerPosition0 == playerPosition3) {
        return true;
      }
    }
  }
}

dynamic check_winner_7x7(List displayGamae) {
  List<List<int>> winningList = [
    [0, 1, 2, 3, 4, 5, 6], //row1
    [7, 8, 9, 10, 11, 12, 13], //row2
    [14, 15, 16, 17, 18, 19, 20], //row3
    [21, 22, 23, 24, 25, 26, 27], //row4
    [28, 29, 30, 31, 32, 33, 34], //row5
    [35, 36, 37, 38, 39, 40, 41], //row6
    [42, 43, 44, 45, 46, 47, 48], //row7

    [0, 7, 14, 21, 28, 35, 42], //col1
    [1, 8, 15, 22, 29, 36, 43], //col2
    [2, 9, 16, 23, 30, 37, 44], //col3
    [3, 10, 17, 24, 31, 38, 45], //col4
    [4, 11, 18, 25, 32, 39, 46], //col5
    [5, 12, 19, 26, 33, 40, 47], //col6
    [6, 13, 20, 27, 34, 41, 48], //col7

    [0, 8, 16, 24, 32, 40, 48], //dia_L1
    [1, 9, 17, 25, 33, 41], //dia_L2
    [2, 10, 18, 26, 34], //dia_L3
    [3, 11, 19, 27], //dia_L4
    [7, 15, 23, 31, 39, 47], //dia_L5
    [14, 22, 30, 38, 46], //dia_L6
    [21, 29, 37, 45], //dia_L7

    [3, 9, 15, 21], //dia_R1
    [4, 10, 16, 22, 28], //dia_R2
    [5, 11, 17, 23, 29, 35], //dia_R3
    [6, 12, 18, 24, 30, 36, 42], //dia_R4
    [13, 19, 25, 31, 37, 43], //dia_R5
    [20, 26, 32, 38, 44], //dia_R6
    [27, 33, 39, 45], //dia_R7
  ];

  for (var winningPos in winningList) {
    String playerPosition0 = displayGamae[winningPos[0]];
    String playerPosition1 = displayGamae[winningPos[1]];
    String playerPosition2 = displayGamae[winningPos[2]];
    String playerPosition3 = displayGamae[winningPos[3]];

    if (playerPosition0.isNotEmpty) {
      if (playerPosition0 == playerPosition1 &&
          playerPosition0 == playerPosition2 &&
          playerPosition0 == playerPosition3) {
        return true;
      }
    }
  }
}
