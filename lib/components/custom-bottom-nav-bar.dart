// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    //////////////// Colors //////////////////
    final Color baseColor = Color.fromARGB(255, 240, 243, 245);
    final Color sacondaryColor = Color.fromARGB(255, 59, 165, 185);

    final size = Size.square(
        MediaQuery.of(context).size.shortestSide); // The display width

    final primarySize = size.shortestSide / 20;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      width: size.shortestSide,
      height: primarySize * 5,
      child: Padding(
        padding: EdgeInsets.only(
          top: primarySize,
          bottom: primarySize * 2,
          left: primarySize,
          right: primarySize,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BottomItem(
              primarySize: primarySize,
              active: true,
              icon: Icons.home,
              title: "Home",
            ),
            BottomItem(
              primarySize: primarySize,
              active: false,
              icon: Icons.category,
              title: "Categories",
            ),
            BottomItem(
              primarySize: primarySize,
              active: false,
              icon: Icons.star,
              title: "Favorites",
            ),
            BottomItem(
              primarySize: primarySize,
              active: false,
              icon: Icons.person,
              title: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}

class BottomItem extends StatelessWidget {
  final bool active;
  final double primarySize;
  final IconData icon;
  final String title;

  const BottomItem({
    super.key,
    required this.primarySize,
    required this.active,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Icon(
            icon,
            size: primarySize,
            color: active ? Colors.grey[900] : Colors.grey[500],
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: primarySize * 0.5,
                color: active ? Colors.grey[900] : Colors.grey[500],
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
