import 'package:flutter/material.dart';

class SavedNewsPage extends StatelessWidget {
  const SavedNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Page'),
      ),
      body: const Center(
        child: Text('Welcome to the News Page!'),
      ),
    );
  }
}
