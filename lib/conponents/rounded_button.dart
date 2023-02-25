import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const RoundedButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xffF9A826),
              borderRadius: BorderRadius.circular(12),

        ),
        child: Center(child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18),),),
      ),
    );
  }
}
