import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class MyReciept extends StatelessWidget {
  final String reciept;

  const MyReciept({super.key, required this.reciept});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: DottedBorder(
        color: Colors.black,
        strokeWidth: 1,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            
          ),
          child: Text(reciept),
        ),
      ),
    );
  }
}