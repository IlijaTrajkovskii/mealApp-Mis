import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  final String imageUrl;

  const DetailImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.network(imageUrl),
    );
  }
}
