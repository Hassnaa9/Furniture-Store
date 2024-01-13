import 'dart:ui';
import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';

import 'cart.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  ScrollController _scrollController = ScrollController();
  int itemCount = 0;
  double rating = 4.8;
  bool isFavorite = false;

  void dispose() {
    _scrollController
        .dispose(); // Dispose the scroll controller when not needed
    super.dispose();
  }

  void scrollToBottom() {
    double bottomPosition = _scrollController.position.viewportDimension;
    scrollToPosition(_scrollController, bottomPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 370,
            child: Image.asset(
              "images/3.png",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          buildScrollableSheet(),
        ],
      ),
    );
  }

  Widget buildScrollableSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      maxChildSize: 1.0,
      minChildSize: 0.5,
      builder: (context, _scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 5,
                  width: 35,
                  color: Colors.lightGreen,
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white54,
                    child: Icon(Icons.star, color: rating >= 1.0 ? Colors
                        .amber : Colors.grey),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white54,
                    child: Icon(Icons.star, color: rating >= 2.0 ? Colors
                        .amber : Colors.grey),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white54,
                    child: Icon(Icons.star, color: rating >= 3.0 ? Colors
                        .amber : Colors.grey),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white54,
                    child: Icon(Icons.star, color: rating >= 4.0 ? Colors
                        .amber : Colors.grey),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white54,
                    child: Icon(Icons.star, color: rating >= 5.0 ? Colors
                        .amber : Colors.grey),
                  ),
                ],
              ),
              SizedBox(width: 15),
              Text(
                rating.toString(),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '\$180',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Table and chair set",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 15),
          Text(

            "Experience the perfect blend of style and comfort with this exquisite dining set. Crafted with care to elevate your dining experience...",
            style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 20),
          Positioned(
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  color: Colors.grey,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (itemCount > 0) {
                          itemCount--;
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(
                          Icons.remove, size: 30, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Text(
                    '$itemCount',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(width: 10),
                Material(
                  color: Colors.grey,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        itemCount++;
                      });
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(
                          Icons.add, size: 30, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Stack(
            children: <Widget>[
          Align(
          alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CartPage()),
                  );
                },
                child: Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 20),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.lightGreen),

                    foregroundColor: MaterialStateProperty.all(
                    Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.all(16),
                ),
              ),
            ),
          ),
        ),
        ],
        ),
        ],
        ),
        ),
        );
      },
    );
  }

  void scrollToPosition(ScrollController scrollController, double position) {
    scrollController.animateTo(
      position,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}