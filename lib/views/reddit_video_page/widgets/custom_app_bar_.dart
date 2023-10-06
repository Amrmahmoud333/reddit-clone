import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.arrow_back),
        SizedBox(
          width: 72,
        ),
        CircleAvatar(
          maxRadius: 15,
          child: Icon(
            Icons.person,
          ),
        ),
        SizedBox(
          width: 7,
        ),
        Text('r/AmrMahmoud'),
      ],
    );
  }
}
