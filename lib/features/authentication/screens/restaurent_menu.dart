import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String imagePath; // New property for image path

  Product({required this.name, required this.price, required this.imagePath});
}

class RestaurentMenu extends StatefulWidget {
  @override
  _RestaurentMenuState createState() => _RestaurentMenuState();
}

class _RestaurentMenuState extends State<RestaurentMenu> {
  final products = <Product>[
    Product(
        name: 'Burger with some',
        price: 10.0,
        imagePath: 'assets/images/home/noodless.jpg'),
    Product(
        name: 'Vegitable Salad',
        price: 20.0,
        imagePath: 'assets/images/home/noodless.jpg'),
    Product(
        name: 'Burger with some',
        price: 30.0,
        imagePath: 'assets/images/home/noodless.jpg'),
    Product(
        name: 'Burger with some',
        price: 40.0,
        imagePath: 'assets/images/home/noodless.jpg'),
    Product(
        name: 'Burger with some',
        price: 40.0,
        imagePath: 'assets/images/home/noodless.jpg')
  ];

  // List to keep track of tap state of each product
  List<bool> _isTappedList = [];

  @override
  void initState() {
    super.initState();
    _isTappedList = List<bool>.filled(products.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 236, 241),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 40, right: 20, left: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 249, 247, 255),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  const Column(
                    children: [
                      Text(
                        "Westway",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Menu",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.screen_share),
                      onPressed: () {
                        // Add share logic
                      },
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildIconButton('All items'),
                    const SizedBox(
                      width: 20,
                    ),
                    _buildIconButton('Veg'),
                    const SizedBox(
                      width: 20,
                    ),
                    _buildIconButton('Non-Veg'),
                    const SizedBox(
                      width: 20,
                    ),
                    _buildIconButton('Beverages'),
                    const SizedBox(
                      width: 20,
                    ),
                    _buildIconButton('Asian'),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Text(
              "Best sellers",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SizedBox(
                height: 550, // Set the height of the container
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: List.generate(products.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: products.indexOf(products[index]) % 2 == 0
                                  ? Colors.white
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(
                                  15), // Add border radius
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  products[index].imagePath,
                                  width: 60,
                                  height: 80,
                                ),
                              ),
                              title: Text(products[index].name),
                              subtitle: Text(
                                  '\$${products[index].price.toStringAsFixed(2)}'),
                              trailing: IconButton(
                                icon: _isTappedList[index]
                                    ? Icon(Icons
                                        .arrow_right) // Change the icon to a right arrow when tapped
                                    : Icon(Icons.add), // Default icon
                                onPressed: () {
                                  setState(() {
                                    _isTappedList[index] =
                                        !_isTappedList[index];
                                  });
                                  // Add functionality to add this product to the cart
                                },
                              ),
                              onTap: () {
                                // Handle tapping on product
                              },
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(shape: BoxShape.rectangle),
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ElevatedButton(
            onPressed: () {
              // Add functionality for the bottom button (e.g., navigate to cart screen)
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Items: ${products.length}'), // Show the number of items
                Text('View Cart'), // Show the option to view the cart
                Text(
                    'Price: \$${calculateTotalPrice()}'), // Show the total price
              ],
            ),
          ),
        ),
      ),

// Function to calculate the total price of the items in the cart
    );
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var product in products) {
      totalPrice += product.price;
    }
    return totalPrice;
  }

  Widget _buildIconButton(String label) {
    return ElevatedButton(
      onLongPress: () {
        // Handle button tap
      },
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 95, 93, 93)),
            ),
          ],
        ),
      ),
    );
  }
}
