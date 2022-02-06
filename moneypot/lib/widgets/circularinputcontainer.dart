import 'package:flutter/material.dart';

class CircularInputContainer extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const CircularInputContainer({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.orange,
      padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: label,
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
        ),
      ),
    );
  }
}
