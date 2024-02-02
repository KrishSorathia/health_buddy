import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Book Appointments'),
          backgroundColor: const Color.fromARGB(255, 34, 161, 178),
          foregroundColor: Colors.white,
        ),
        body: const Center(
          child: Text('Hello, World!'),
        ),
      ),
    ),
  );
}
