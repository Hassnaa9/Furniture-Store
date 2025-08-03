import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detailproduct.dart';
import 'forgot_password.dart';
import 'livingroom.dart';
import '../sleepingroom.dart';
import 'kitchenroom.dart';
import 'familyroom.dart';
import 'cart.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      title: "Classic  chair",
      description: 'living space  . ',
      image: 'images/img_13.png',
      price: 185,
    ),
    DetailModel(
      title: "living room ",
      description: ' living space   ',
      image: 'images/img_16.png',
      price: 185,
    ),
    DetailModel(
      title: "modern ",
      description: ' living space  . ',
      image: 'images/img_11.png',
      price: 185,
    ),
    DetailModel(
      title: "Classic living",
      description: 'E living space  ',
      image: 'images/img_9.png',
      price: 185,
    ),
    DetailModel(
      title: "sleeping room ",
      description: 'living space   ',
      image: 'images/chair.png',
      price: 185,
    ),
    DetailModel(
      title: "Classic room",
      description: ' living space  . ',
      image: 'images/img_5.png',
      price: 185,
    ),
    // Add other DetailModels as needed
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
          onPressed: () {},
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
          CategoriesListView(onCategoryTap: (categoryIndex) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryPage(categoryIndex: categoryIndex),
              ),
            );
          }),
          const SizedBox(height: 15),
          for (int index = 0; index < _list.length; index++)
            CustomDetailsWidget(
              detailModel: _list[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Product(),
                  ),
                );
              },
            ),
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




class Homee extends StatefulWidget {
  const Homee({Key? key});

  @override
  State<Homee> createState() => _HomeStatee();
}

class _HomeStatee extends State<Homee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: CategoriesListView(
        onCategoryTap: (index) {
          switch (index) {
            case 0:
            case 1:
            case 2:
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Room()),
              );
              break;
          }
        },
      ),
    );
  }
}

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({required this.onCategoryTap});

  final Function(int) onCategoryTap;

  final List<CategoryModel> categories = const [
    CategoryModel(imageAssetUrl: 'images/img_9.png', name: 'Living Room'),
    CategoryModel(imageAssetUrl: 'images/img_8.png', name: 'Kitchen Room'),
    CategoryModel(imageAssetUrl: 'images/img_17.png', name: 'Family Room'),
    CategoryModel(imageAssetUrl: 'images/img_10.png', name: 'Sleeping Room'),
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
            onTap: () {
              onCategoryTap(index);
            },
          );
        },
      ),
    );
  }
}

class CategoryModel {
  final String imageAssetUrl;
  final String name;

  const CategoryModel({
    required this.imageAssetUrl,
    required this.name,
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
          borderRadius: BorderRadius.circular(9),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Room()),
            );
          },
          child: Image.asset(category.imageAssetUrl),
        ),
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
  const CustomDetailsWidget({required this.detailModel, required this.onTap});
  final DetailModel detailModel;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
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
                          onPressed: onTap,
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
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final int categoryIndex;

  const CategoryPage({required this.categoryIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category $categoryIndex'),
      ),
      body: Center(
        //child: Text('Category $categoryIndex Details'),
      ),
    );
  }
}

