import 'package:flutter/material.dart';

class DetailTitle extends StatelessWidget {
  final String name;

  const DetailTitle({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name.toUpperCase(),
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
