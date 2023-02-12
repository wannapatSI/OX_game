import 'package:flutter/material.dart';

dynamic check_for_draw(List display, bool game) {
  if (game) {
    return;
  }

  bool draw = true;
  for (var displayPlayer in display) {
    if (displayPlayer.isEmpty) {
      draw = false;
    }
  }

  if (draw) {
    return true;
  }
}
