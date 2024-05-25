// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:camping/objects/card-item.object.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailedTravel extends StatefulWidget {
  final CardItem data;
  const DetailedTravel({super.key, required this.data});

  @override
  State<DetailedTravel> createState() => _DetailedTravelState();
}

class _DetailedTravelState extends State<DetailedTravel> {
  @override
  Widget build(BuildContext context) {
    //////////////// Colors //////////////////
    final Color baseColor = Color.fromARGB(255, 240, 243, 245);
    final Color sacondaryColor = Color.fromARGB(255, 59, 165, 185);

    final size = Size.square(
        MediaQuery.of(context).size.shortestSide); // The display width

    final primarySize = size.shortestSide / 20;

    return Scaffold(
      backgroundColor: baseColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.data.name, // same indicator (must)
                  child: Container(
                    height: primarySize * 25,
                    child: ClipRRect(
                      child: Image.asset(
                        widget.data.imageUrls[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: primarySize * 25,
                  width: size.shortestSide,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(1),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(primarySize),
                        child: Text(
                          widget.data.name,
                          style: TextStyle(
                            color: baseColor.withOpacity(0.9),
                            fontSize: primarySize * 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(primarySize),
                child: Container(
                  width: size.shortestSide,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "\$${widget.data.price} / Person",
                                style: TextStyle(
                                  fontSize: primarySize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: primarySize * 0.5,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.timer),
                                  SizedBox(
                                    width: primarySize * 0.5,
                                  ),
                                  Text(
                                    "${widget.data.duration.toInt().toString()} days",
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                            width: primarySize * 3,
                            height: primarySize * 3,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.thumb_up,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: primarySize * 2,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget.data.description,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(primarySize),
                        child: SizedBox(
                          width: size.shortestSide,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: primarySize * 0.7,
                              ),
                              child: Text(
                                "Book Travel",
                                style: TextStyle(
                                  color: baseColor,
                                  fontSize: primarySize * 0.6,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
