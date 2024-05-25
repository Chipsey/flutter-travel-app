// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:camping/components/custom-app-bar.dart';
import 'package:camping/components/custom-bottom-nav-bar.dart';
import 'package:camping/objects/card-item.object.dart';
import 'package:camping/screens/detailed-travel.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //////////////// Colors //////////////////
    final Color baseColor = Color.fromARGB(255, 240, 243, 245);
    final Color sacondaryColor = Color.fromARGB(255, 59, 165, 185);

    final size = Size.square(
        MediaQuery.of(context).size.shortestSide); // The display width

    final primarySize = size.shortestSide / 20;

    //card data
    List<CardItem> cardItems = [
      CardItem(
        imageUrls: ['assets/images/card4.jpeg', 'assets/images/card4.jpeg'],
        name: 'Vibrant Country Life',
        location: 'New York, USA',
        rating: 4.3,
        description:
            'Dive into the vibrant and dynamic city life of New York, where there\'s always something to do. Explore iconic landmarks such as Times Square, Central Park, and the Statue of Liberty. \nImmerse yourself in the city\'s rich cultural scene with world-class museums, theaters, and galleries.',
        price: 650,
        duration: 5,
      ),
      CardItem(
        imageUrls: ['assets/images/card1.jpeg', 'assets/images/card5.jpeg'],
        name: 'Serene Lakeside Retreat',
        location: 'Lake Tahoe, USA',
        rating: 4.7,
        description:
            'A peaceful retreat by the lake with stunning views and plenty of outdoor activities. Enjoy your mornings sipping coffee while overlooking the tranquil waters. This lakeside retreat offers a perfect blend of relaxation and adventure, with opportunities for hiking, fishing, and kayaking. Unwind in comfortable accommodations surrounded by nature\'s beauty.',
        price: 250,
        duration: 5,
      ),
      CardItem(
        imageUrls: ['assets/images/card5.jpeg', 'assets/images/card3.jpeg'],
        name: 'Mountain Hiking Adventure',
        location: 'Swiss Alps, Switzerland',
        rating: 4.8,
        description:
            'Experience the thrill of mountain hiking with breathtaking views of the Swiss Alps. Embark on an unforgettable adventure as you traverse scenic trails, passing through alpine meadows and towering peaks. Whether you\'re an experienced hiker or a novice, there are trails suitable for all skill levels. After a day of exploration, relax in cozy mountain lodges and savor delicious local cuisine.',
        price: 1050,
        duration: 5,
      ),
      CardItem(
        imageUrls: ['assets/images/card2.jpeg', 'assets/images/card3.jpeg'],
        name: 'Historic Old Town',
        location: 'Prague, Czech Republic',
        rating: 4.6,
        description:
            'Explore the historic charm and beautiful architecture of Prague\'s old town. Wander through cobblestone streets lined with colorful buildings, and discover centuries-old landmarks such as Prague Castle and Charles Bridge. Immerse yourself in the rich culture and vibrant atmosphere of this European gem. Indulge in traditional Czech cuisine at quaint cafes and beer halls, and experience the magic of Prague by night.',
        price: 340,
        duration: 5,
      ),
      CardItem(
        imageUrls: ['assets/images/card3.jpeg', 'assets/images/card2.jpeg'],
        name: 'Beautiful Sandy Beach',
        location: 'California, USA',
        rating: 4.5,
        description:
            'A serene beach with golden sands and crystal clear waters, perfect for a relaxing getaway. Bask in the warm California sun as you lounge on the soft sands and listen to the soothing sound of waves crashing against the shore. Whether you\'re a sunbather, a surfer, or a beachcomber, there\'s something for everyone to enjoy. Explore nearby coastal towns and indulge in fresh seafood delicacies.',
        price: 3500,
        duration: 5,
      ),
    ];

    return Scaffold(
      backgroundColor: baseColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ////////////// Custom App Bar ////////////////////////
          CustomAppBar(), // Done for now

          ///////////////// Body //////////////////////
          //Search bar
          Padding(
            padding: EdgeInsets.only(
              top: primarySize * 0.5,
              bottom: primarySize,
              left: primarySize,
              right: primarySize,
            ),
            child: TextField(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: primarySize * 0.5,
              ),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search..",
                prefixIcon: Icon(Icons.search),
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),

          // Cards
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: primarySize),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: cardItems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 0,
                    childAspectRatio: 1.1,
                  ), // Play around
                  itemBuilder: (context, index) {
                    return ItemCard(
                      size: primarySize,
                      data: cardItems[index],
                    );
                  },
                ),
              ),
            ),
          ),

          // Bottom Nav Bar
          CustomBottomNavBar(), // Now let's make the detailed card openings
        ],
      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  final CardItem data;
  final double size;
  const ItemCard({super.key, required this.size, required this.data});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailedTravel(data: widget.data),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: widget.data.name,
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 20,
                  offset: Offset(5, 5),
                ),
              ]),
              height: widget.size * 12, // play around
              width: widget.size * 20, // play around
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.data.imageUrls[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          SizedBox(
            height: widget.size * 0.5,
          ),
          ///// Card wordings
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.size * 0.3),
            child: Text(
              widget.data.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: widget.size * 0.8,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.size * 0.3,
              vertical: widget.size * 0.3,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  size: widget.size * 0.6,
                  color: Colors.grey[500],
                ),
                SizedBox(width: widget.size * 0.3),
                Text(
                  widget.data.location,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: widget.size * 0.5,
                  ),
                ),
                SizedBox(width: widget.size),
                Icon(
                  Icons.star,
                  size: widget.size * 0.6,
                  color: Colors.amber[600],
                ),
                SizedBox(width: widget.size * 0.3),
                Text(
                  widget.data.rating.toString(),
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: widget.size * 0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





// animation