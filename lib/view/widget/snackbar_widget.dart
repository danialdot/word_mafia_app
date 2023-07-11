import 'package:flutter/material.dart';

void showSnackBarWidget({
  required BuildContext context,
  required Color backgroundColor,
  required String text,
}) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: const Duration(seconds: 3),
      content: Container(
        height: 45,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: Text(text)),
      ),
    ),
  );
  await Future.delayed(const Duration(seconds: 3));
}