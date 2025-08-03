import 'package:flutter/material.dart';

// Model class for items in the cart
class CartItem {
  final String name;
  final String image;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CartPage(),
    );
  }
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Sample list of items in the cart
  List<CartItem> _cartItems = [
    CartItem(name: 'chair', image: "images/2.png", price: 20.0),
    CartItem(name: 'bed', image: "images/img_16.png", price: 30.0),
    CartItem(name: 'speepingroom', image: "images/img_13.png", price: 30.0),
    CartItem(name: 'living room', image: "images/img_12.png", price: 30.0),
    // Add more items here
  ];

  // Function to calculate the total price
  double calculateTotal() {
    double total = 0.0;
    for (var item in _cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(
          "My Shopping Bag",
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
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              contentPadding: EdgeInsets.all(5),
              leading: Image.asset(
                _cartItems[index].image,
                width: 80,
                height: 50,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _cartItems[index].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.highlight_remove, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        _cartItems.removeAt(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${_cartItems[index].name} removed from cart'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${_cartItems[index].price.toString()}L.E'),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline , color: const Color(0xffabc4aa)),
                        onPressed: () {
                          setState(() {
                            if (_cartItems[index].quantity > 1) {
                              _cartItems[index].quantity--;
                            }
                          });
                        },
                      ),
                      Text(_cartItems[index].quantity.toString()),

                      IconButton(
                        icon: Icon(Icons.add_circle_outline, color : const Color(0xffabc4aa)),
                        onPressed: () {
                          setState(() {
                            _cartItems[index].quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              onTap: () {
                // Implement action on item tap (if needed)
              },
            ),
          );
        },
      ),


      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ${calculateTotal().toStringAsFixed(2)}L.E',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _cartItems.clear();
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('All items removed from cart'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffabc4aa)),
                ),
                child: Text('Checkout', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}