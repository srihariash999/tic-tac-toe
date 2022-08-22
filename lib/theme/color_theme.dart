import 'package:flutter/material.dart';

/// Assign colors to the players text according to their turn
Color enumToColor(int playerNumber) {
  switch (playerNumber) {
    case 1:
      return Colors.red;
    case 2:
      return Colors.blue;
    default:
      return Colors.black;
  }
}
