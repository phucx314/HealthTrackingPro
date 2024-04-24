import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.width,
    required this.left,
    required this.right,
    this.color = const Color(0xFF4D8BAA),
    this.textColor = Colors.white, // Default value for textColor
  });

  final Function()? onTap;
  final String title;
  final double width;
  final double left;
  final double right;
  final Color color;
  final Color textColor; // Not nullable anymore

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: 60,
        width: width,
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(left, 0, right, 0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
