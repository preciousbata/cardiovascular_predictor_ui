import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OptionCard extends StatelessWidget {
  final String text;
  final String imageUrl;

  const OptionCard({
    super.key,
    required this.text,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight / 12,
      width: screenWidth - 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.greenAccent.withOpacity(0.7)),
      child: Row(
        children: [
          SizedBox(
            child: Lottie.asset(imageUrl),
          ),
          SizedBox(
            width: screenHeight / 15,
          ),
          Expanded(
              child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          ))
        ],
      ),
    );
  }
}
