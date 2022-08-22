import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:tic_tac_toe/utilities/constants.dart';

/// Tile size of the game board
double tileSize = 120.0;

/// GameRow
class GameRow extends StatelessWidget {
  const GameRow({
    Key? key,
    required this.row,
    required this.rowNumber,
    required this.onTap,
  }) : super(key: key);

  /// row
  final List<int> row;

  /// rowNumber
  final int rowNumber;

  /// onTap callback
  final Function(int i, int j) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: row
          .mapIndexed(
            (index, i) => InkWell(
              onTap: () {
                onTap(rowNumber, index);
              },
              child: TileWidget(
                state: i,
              ),
            ),
          )
          .toList(),
    );
  }
}

/// TileWidget is a widget that displays a tile on the game board.
/// It is a square with a images in it. According to the state of the tile,
/// it displays a different image.
class TileWidget extends StatelessWidget {
  const TileWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  /// State of the tile. This determines the image of the tile.
  final int state;

  @override
  Widget build(BuildContext context) {
    if (state == 1) {
      return const TileContainer(
        imagePath: sriHariFilePath,
      );
    } else if (state == 2) {
      return const TileContainer(
        imagePath: mouliFilePath,
      );
    }

    return const TileContainer();
  }
}

/// TileContainer is a container for the tiles. It is used to display the
/// tiles in the game board.
class TileContainer extends StatelessWidget {
  const TileContainer({
    Key? key,
    this.imagePath,
  }) : super(key: key);

  /// Image path of the tile
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: tileSize,
      width: tileSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(),
        color: Colors.white60,
      ),
      alignment: Alignment.center,
      child: imagePath == null
          ? null
          : Image.asset(
              imagePath!,
              fit: BoxFit.contain,
            ),
    );
  }
}
