import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String imagePath; // New property for image path

  Product({required this.name, required this.price, required this.imagePath});
}

class RestaurentMenu extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 236, 241),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
            child: Column(
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
                const Text(
                  "Best sellers",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: index % 2 == 0
                                  ? Colors.white
                                  : Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(
                                  15), // Add border radius
                            ),

                            // color: index % 2 == 0
                            //     ? Colors.white
                            //     : Colors.grey.withOpacity(0.2),
                            child: ListTile(
                              contentPadding: EdgeInsets
                                  .zero, // Remove default ListTile padding
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  products[index].imagePath,
                                  width: 60, // Adjust image width as needed
                                  height: 60, // Adjust image height as needed
                                ),
                              ),
                              title: Text(products[index].name),
                              subtitle: Text(
                                  '\$${products[index].price.toStringAsFixed(2)}'),
                              trailing: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  // Add functionality to add this product to the cart
                                },
                              ),
                              onTap: () {
                                // Handle tapping on product
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: double.maxFinite, // Adjust the width as needed
        height: 70, // Adjust the height as needed
        child: FloatingActionButton.extended(
          onPressed: () {
            // Navigate to cart page
          },
          label: const Text('Cart (0)'),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20), // Adjust the border radius as needed
          ),
          elevation: 2, // Adjust the elevation as needed
          backgroundColor: Colors.blue, // Adjust the background color as needed
        ),
      ),
    );
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
        padding: const EdgeInsets.all(8.0), // Adjust the spacing as needed
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8), // Adjust spacing between icon and label
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
