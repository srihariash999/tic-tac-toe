/// `GameState` is a model class.
///
/// It contains the current state of the game.
class GameState {
  // Constructor
  GameState({
    required this.currentTurn,
    required this.gameOver,
    required this.result,
  });

  /// currentTurn indicates which player's turn it is.
  int currentTurn;

  /// gameOver indicates whether the game is over or not.
  bool gameOver;

  /// the result of the game, stating who is the winner
  String result;
}
