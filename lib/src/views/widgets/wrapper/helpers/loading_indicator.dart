// Flutter imports:
import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(
        Color(0xFF146399),
      ),
      backgroundColor: Color(0xFF18a0fb),
    );
  }
}
