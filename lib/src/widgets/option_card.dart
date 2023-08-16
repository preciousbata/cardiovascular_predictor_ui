import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OptionCard extends StatelessWidget {
  final String text;
  final String imageUrl;
  final void Function()? onTap;
  const OptionCard(
      {super.key,
      required this.text,
      required this.imageUrl,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: screenHeight / 12,
        width: screenHeight / 4.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.greenAccent.withOpacity(0.7)),
        child: Row(
          children: [
            SizedBox(
              child: Lottie.asset(imageUrl),
            ),
            SizedBox(
              width: screenHeight / 87,
            ),
            Expanded(child: Text(text))
          ],
        ),
      ),
    );
  }
}
