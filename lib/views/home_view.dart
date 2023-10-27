import 'package:flutter/material.dart';
import 'package:untitled/views/calculator_view.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: CalculatorView(),
      ),
    );
  }
}
