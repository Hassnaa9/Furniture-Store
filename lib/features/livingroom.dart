import 'package:flutter/material.dart';

import 'home.dart';
import 'livingroom.dart';
import 'detailproduct.dart';

import 'cart.dart';


class Room extends StatefulWidget {
  const Room({Key? key});

  @override
  State<Room> createState() => _RoomState();
}

class _RoomState extends State<Room> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Homee(),
    Room(),
    CartPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        // Navigate to the home page when the home icon is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else if (_selectedIndex == 1) {
        // Navigate to the search page when the search icon is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else if (_selectedIndex == 2) {
        // Navigate to the cart page when the cart icon is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartPage ()),
        );
      }
    });
  }
  final List<DetailModel> _list = [
    DetailModel(
      title: "Classic Pepperoni",
      description: 'sleeping room ',
      image: 'images/chairr.png',
      price: 185,
    ),
    DetailModel(
      title: "Classic Pepperoni",
      description: 'bed',
      image: 'images/img_12.png',
      price: 185,
    ),
    DetailModel(
      title: "Classic Pepperoni",
      description: 'bed',
      image: 'images/img_13.png',
      price: 185,
    ),
    DetailModel(
      title: "Classic Pepperoni",
      description: 'sleeping room',
      image: 'images/img_14.png',
      price: 185,
    ),
    DetailModel(
      title: "Classic Pepperoni",
      description: 'sleep room ',
      image: 'images/img_15.png',
      price: 185,
    ),
    DetailModel(
      title: "Classic Pepperoni",
      description: 'bed ',
      image: 'images/img_16.png',
      price: 185,
    ),
    DetailModel(
      title: "Classic Pepperoni",
      description: 'Elevate your living space with a touch of modern elegance. ',
      image: 'images/img_17.png',
      price: 185,
    ),
    DetailModel(
      title: "Classic Pepperoni",
      description: 'Elevate your living space with a touch of modern elegance. ',
      image: 'images/img_15.png',
      price: 185,
    ),
    DetailModel(
      title: "Classic Pepperoni",
      description: 'Elevate your living space with a touch of modern elegance. ',
      image: 'images/img_12.png',
      price: 185,
    ),
    DetailModel(
      title: "Classic Pepperoni",
      description: 'Elevate your living space with a touch of modern elegance. ',
      image: 'images/img_13.png',
      price: 185,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DecorHiver",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          tooltip: "Go Back..",
          onPressed: () {

          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            tooltip: "Search..",
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 5),
          const CategoriesListView(),
          const SizedBox(height: 15),
          for (int index = 0; index < _list.length; index++)
            CustomDetailsWidget(detailModel: _list[index]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
//
// class HomePage extends StatelessWidget {
//   const HomePage();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "DecorHiver",
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//           tooltip: "Go Back..",
//           onPressed: () {},
//         ),
//         actions: [
//           // IconButton(
//           //   icon: Icon(
//           //     Icons.search,
//           //     color: Colors.black,
//           //   ),
//           //   tooltip: "Search..",
//           //   onPressed: () {},
//           // ),
//         ],
//       ),
//       body: ListView(
//         physics: const BouncingScrollPhysics(),
//         children: [
//           const SizedBox(height: 5),
//           const CategoriesListView(),
//           const SizedBox(height: 15),
//           // Add your other widgets here
//         ],
//       ),
//     );
//   }
// }

class CategoryModel {
  final String imageAssetUrl;

  const CategoryModel({
    required this.imageAssetUrl,
  });
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({required this.category, this.onTap});

  final CategoryModel category;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 120,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3,
              offset: Offset(4, 8),
            ),
          ],
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(category.imageAssetUrl),
          ),
          borderRadius: BorderRadius.circular(9),
        ),
      ),
    );
  }
}

class CategoriesListView extends StatelessWidget {
  const CategoriesListView();

  final List<CategoryModel> categories = const [
    CategoryModel(
      imageAssetUrl: 'images/img_1.png',
    ),
    CategoryModel(
      imageAssetUrl: 'images/img_2.png',
    ),
    CategoryModel(
      imageAssetUrl: 'images/img_3.png',
    ),
    CategoryModel(
      imageAssetUrl: 'images/img_4.png',
    ),
    CategoryModel(
      imageAssetUrl: 'images/img_5.png',
    ),
    CategoryModel(
      imageAssetUrl: 'images/img_6.png',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryCard(
            category: categories[index],
          );
        },
      ),
    );
  }
}

class DetailModel {
  final String image;
  final String title;
  final String description;
  final double price;

  DetailModel({
    required this.price,
    required this.image,
    required this.title,
    required this.description,
  });
}

class CustomDetailsWidget extends StatelessWidget {
  const CustomDetailsWidget({required this.detailModel});

  final DetailModel detailModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        children: [
          Container(
            width: 120,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(detailModel.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 100,
                    offset: Offset(4, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(detailModel.title),
                  Text(detailModel.description),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('${detailModel.price} EGP'),
                      const SizedBox(width: 80),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Product ()),
                          );
                        },

                        icon: const Icon(Icons.arrow_back_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
