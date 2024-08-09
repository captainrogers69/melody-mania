// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

// extension ExtBuildContext on BuildContext {
//   showSnackBar(String message) {
//     ScaffoldMessenger.of(this).showSnackBar(
//       SnackBar(
//         content: Text(message),
//       ),
//     );
//   }
// }

extension SnackBarExtension on GlobalKey<ScaffoldMessengerState> {
  void showingSnackBar(String message) {
    currentState!.showSnackBar(SnackBar(content: Text(message)));
  }
}
