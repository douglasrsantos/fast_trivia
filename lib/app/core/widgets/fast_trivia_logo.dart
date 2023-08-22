import 'package:flutter/material.dart';

class FastTriviaLogo extends StatelessWidget {
  const FastTriviaLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/logo.png',
          height: 200,
        ),
        const Text(
          'Fast Trivia',
          style:  TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}
