// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    //////////////// Colors //////////////////
    final Color baseColor = Color.fromARGB(255, 240, 243, 245);
    final Color sacondaryColor = Color.fromARGB(255, 59, 165, 185);

    final size = Size.square(
        MediaQuery.of(context).size.shortestSide); // The display width

    final primarySize = size.shortestSide / 20;

    return Container(
      width: size.shortestSide,
      child: Padding(
        padding: EdgeInsets.only(
          top: primarySize * 4,
          bottom: primarySize,
          left: primarySize,
          right: primarySize,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Let's explore the world!"),
                  Text(
                    "Josh.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: primarySize * 2,
                  height: primarySize * 2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    color: baseColor,
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
