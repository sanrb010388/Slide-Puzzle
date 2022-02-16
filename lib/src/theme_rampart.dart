// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'core/puzzle_proxy.dart';
import 'flutter.dart';
import 'shared_theme.dart';

const _red = Color.fromARGB(255, 250, 219, 216);
const _blue = Color.fromARGB(255, 113, 193, 233);
const _green = Color.fromARGB(255, 118, 215, 196);

class ThemeRampart extends SharedTheme {
  @override
  String get name => 'Rampart One';

  const ThemeRampart();

  @override
  Color get puzzleThemeBackground => _red;

  @override
  Color get puzzleBackgroundColor => _blue;

  @override
  Color get puzzleAccentColor => _green;

  @override
  RoundedRectangleBorder puzzleBorder(bool small) => RoundedRectangleBorder(
        side: const BorderSide(
          color: Color.fromARGB(255, 103, 103, 105),
          width: 8,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(small ? 10 : 18),
        ),
      );

  @override
  Widget tileButton(int i, PuzzleProxy puzzle, bool small) {
    final correctColumn = i % puzzle.width;
    final correctRow = i ~/ puzzle.width;

    final primary = (correctColumn + correctRow).isEven;

    if (i == puzzle.tileCount) {
      assert(puzzle.solved);
      return Center(
        child: Icon(
          Icons.thumb_up,
          size: small ? 50 : 72,
          color: _green,
        ),
      );
    }

    final content = Text(
      (i + 1).toString(),
      style: TextStyle(
        color: primary ? _red : _blue,
        fontFamily: 'Rampart One',
        fontSize: small ? 40 : 77,
      ),
    );

    return createButton(
      puzzle,
      small,
      i,
      content,
      color: primary ? _green : _red,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: primary ? _blue : _green, width: 5),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
