import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.arrow_back),
        const SizedBox(
          width: 72,
        ),
        const CircleAvatar(
          maxRadius: 15,
          child: Icon(
            Icons.person,
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        Text('r/$title'),
      ],
    );
  }
}
