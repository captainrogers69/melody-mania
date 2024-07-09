import 'dart:math' as math;

import 'package:flutter/material.dart';

class MelodyUtils {
  static String kAvatar =
      'https://firebasestorage.googleapis.com/v0/b/melodic-mania.appspot.com/o/83895813_2495299650725786_9031145110460432384_n.jpg?alt=media&token=cb604a48-ae29-499a-b46c-be30992d2fbb';

  static const freeScrollPhysics = BouncingScrollPhysics(
    parent: ClampingScrollPhysics(),
  );

  static bool isJsonDataType(json) {
    return json.runtimeType.toString() == "_Map<String, dynamic>";
  }

  List<Color> generateRandomPrimaryColors(int length) {
    final random = math.Random();
    return List.generate(length, (index) {
      final red = random.nextInt(256);
      final green = random.nextInt(256);
      final blue = random.nextInt(256);
      final colorValue = (red << 16) | (green << 8) | blue;
      return Color(colorValue).withOpacity(1.0);
    });
  }

  static const dataTypeJsonValidator = '_Map<String, dynamic>';
  static const dataTypeListValidator = 'List<dynamic>';
  static const dataTypeBoolValidator = 'bool';
  static const dataTypeStringValidator = 'String';
}
