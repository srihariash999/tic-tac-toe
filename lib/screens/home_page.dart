import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utilities/constants.dart';

import '../models/game_state.dart';
import '../theme/color_theme.dart';
import '../widgets/tile_widget.dart';

/// Home page of the app
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// State of the home page
class _MyHomePageState extends State<MyHomePage> {
  List<List<int>> boardState = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0],
  ];

  /// Create a gameState object
  GameState gameState = GameState(currentTurn: 1, gameOver: false, result: "");

  /// Function to update the boardState
  void _changeState(int i, int j) {
    if (boardState[i][j] == 0) {
      setState(() {
        boardState[i][j] = gameState.currentTurn;
        gameState.currentTurn = gameState.currentTurn == 1 ? 2 : 1;
      });
      _checkGameStatus();
    }
  }

  /// set the game state to gameOver
  void _setGameOver(int winner) {
    gameState.result = "Player $winner wins!";
    gameState.gameOver = true;
    setState(() {});
  }

  /// Function to check the game status
  void _checkGameStatus() {
    // Top row
    if (boardState[0][0] == boardState[0][1] &&
        boardState[0][1] == boardState[0][2] &&
        boardState[0][0] != 0) {
      setState(() {
        _setGameOver(boardState[0][0]);
      });
      return;
    }

    // middle row
    if (boardState[1][0] == boardState[1][1] &&
        boardState[1][1] == boardState[1][2] &&
        boardState[1][0] != 0) {
      setState(() {
        _setGameOver(boardState[1][0]);
      });
      return;
    }

    // bottom row
    if (boardState[2][0] == boardState[2][1] &&
        boardState[2][1] == boardState[2][2] &&
        boardState[2][0] != 0) {
      setState(() {
        _setGameOver(boardState[2][0]);
      });
      return;
    }

    // left column
    if (boardState[0][0] == boardState[1][0] &&
        boardState[1][0] == boardState[2][0] &&
        boardState[0][0] != 0) {
      setState(() {
        _setGameOver(boardState[0][0]);
      });
      return;
    }

    // middle column
    if (boardState[0][1] == boardState[1][1] &&
        boardState[1][1] == boardState[2][1] &&
        boardState[0][1] != 0) {
      setState(() {
        _setGameOver(boardState[0][1]);
      });
      return;
    }

    // right column
    if (boardState[0][2] == boardState[1][2] &&
        boardState[1][2] == boardState[2][2] &&
        boardState[0][2] != 0) {
      setState(() {
        _setGameOver(boardState[0][2]);
      });
      return;
    }

    // left diagonal
    if (boardState[0][0] == boardState[1][1] &&
        boardState[1][1] == boardState[2][2] &&
        boardState[0][0] != 0) {
      setState(() {
        _setGameOver(boardState[0][0]);
      });
      return;
    }

    // right diagonal
    if (boardState[0][2] == boardState[1][1] &&
        boardState[1][1] == boardState[2][0] &&
        boardState[0][2] != 0) {
      setState(() {
        _setGameOver(boardState[0][2]);
      });
      return;
    }
    bool filled = true;

    for (int i = 0; i < boardState.length; i++) {
      for (int j = 0; j < boardState[i].length; j++) {
        if (boardState[i][j] == 0) {
          filled = false;
        }
      }
    }

    if (filled) {
      gameState.gameOver = true;
      gameState.result = "It's a draw !";
      setState(() {});

      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    tileSize = MediaQuery.of(context).size.height / 5;

    final headline4Theme = Theme.of(context).textTheme.headline4;
    return Scaffold(
      appBar: AppBar(
        // title: Text("Turn for : Player ${gameState.currentTurn}"),
        title: const Text("Tic-Tac-Toe"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 60,
                        child: Row(
                          children: [
                            Image.asset(sriHariFilePath),
                            const SizedBox(width: 24),
                            Text(
                              "Player 1",
                              style: headline4Theme!.copyWith(
                                color: enumToColor(1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Text(
                      'vs',
                      style: headline4Theme,
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: SizedBox(
                        height: 60,
                        child: Row(
                          children: [
                            Text(
                              "Player 2",
                              style: headline4Theme.copyWith(
                                color: enumToColor(2),
                              ),
                            ),
                            const SizedBox(width: 24),
                            Image.asset(mouliFilePath),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline4,
                  children: [
                    const TextSpan(
                      text: "Turn for : ",
                    ),
                    TextSpan(
                      text: "Player ${gameState.currentTurn}",
                      style: TextStyle(
                        color: enumToColor(gameState.currentTurn),
                      ),
                    ),
                  ],
                ),
              ),
              // Text(
              //   "Turn for : Player ${gameState.currentTurn}",
              //   style: Theme.of(context).textTheme.headline4,
              // ),
              const SizedBox(height: 24),
              GameRow(
                row: boardState[0],
                rowNumber: 0,
                onTap: _changeState,
              ),
              GameRow(
                row: boardState[1],
                rowNumber: 1,
                onTap: _changeState,
              ),
              GameRow(
                row: boardState[2],
                rowNumber: 2,
                onTap: _changeState,
              )
            ],
          ),
          if (gameState.gameOver)
            Center(
              child: Container(
                height: tileSize * 3,
                width: tileSize * 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.black.withOpacity(0.8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Game Over",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42.0,
                      ),
                    ),
                    Text(
                      gameState.result,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          gameState = GameState(
                            currentTurn: 1,
                            gameOver: false,
                            result: "",
                          );
                          boardState = [
                            [0, 0, 0],
                            [0, 0, 0],
                            [0, 0, 0]
                          ];
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text("Reset Game"),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
