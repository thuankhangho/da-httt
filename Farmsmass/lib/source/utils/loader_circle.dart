import 'package:flutter/material.dart';

class LoaderCircle extends StatelessWidget {
  const LoaderCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
