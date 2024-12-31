import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Function(String) onTap;
  final Color shadowColor; // Add shadowColor
  final double elevation; // Add elevation

  CalcButton(
      this.text,
      this.color,
      this.textColor,
      this.onTap, {
        this.shadowColor = Colors.black, // Default shadowColor
        this.elevation = 8.0, // Default elevation
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Use backgroundColor instead of primary
        foregroundColor: textColor, // Use foregroundColor instead of onPrimary
        padding: EdgeInsets.all(20),
        shape: CircleBorder(),
        shadowColor: shadowColor, // Apply shadowColor
        elevation: elevation, // Apply elevation
      ),
      onPressed: () => onTap(text),
      child: Text(
        text,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
