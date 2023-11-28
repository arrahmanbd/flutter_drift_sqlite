import 'package:flutter/material.dart';

import '../error/exception.dart';

class Utils {
  static void showErrorSnackbar(BuildContext context, dynamic error) {
    String errorMessage;

    if (error is AppError) {
      errorMessage = error.message;
    } else {
      errorMessage = "An unexpected error occurred";
    }

    final snackBar = SnackBar(
      content: Text(errorMessage),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
