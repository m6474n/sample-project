import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String text;
  final Icon icon;
  final TextEditingController controller;
  const InputField({Key? key, required this.text, required this.icon, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          // fillColor: Colors.orange.shade100.withOpacity(0.6),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),

          ),
          hintText: text,
          prefixIcon: icon,
          hintStyle: TextStyle(color: Colors.grey),

        ),
      ),
    );
  }
}
