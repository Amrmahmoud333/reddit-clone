import 'package:flutter/material.dart';
import 'package:reddit/core/themes/theme.dart';
import 'package:reddit/views/reddit_video_page/reddit_video_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reddit',
      theme: ThemeOfProject.darkTheme,
      home: const RedditVideoScreen(),
    );
  }
}