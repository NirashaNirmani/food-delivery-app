import 'package:flutter/material.dart';
import 'package:foodyapp/features/authentication/screens/restaurent_menu.dart';
import 'package:get/get.dart';

class Product {
  final String name;
  final double price;
  final String imagePath; // New property for image path

  Product({required this.name, required this.price, required this.imagePath});
}

class RestaurentDetails extends StatelessWidget {
  RestaurentDetails({Key? key}) : super(key: key);
  final products = <Product>[
    Product(
        name: 'Burger with some',
        price: 10.0,
        imagePath: 'assets/images/home/noodless.jpg'),
    Product(
        name: 'Vegitable Salad',
        price: 20.0,
        imagePath: 'assets/images/home/noodless.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 237, 236, 241),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 190, 174, 98),
                  image: DecorationImage(
                      image: AssetImage("assets/images/home/noodless.jpg"),
                      fit: BoxFit.cover),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(70)),
                ),
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: IconButton(
                            icon: const Icon(Icons.favorite),
                            onPressed: () {
                              // Add favorite logic
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: IconButton(
                            icon: const Icon(Icons.screen_share),
                            onPressed: () {
                              // Add share logic
                            },
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 50),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 128, 128, 128),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 237, 236, 241),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30, left: 30, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Westway',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '15 min',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Healthy eating means eating a variety of \nfoods that give you the nutrients you need to \nmaintain your health, feel good, \nand have energy.',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30, left: 30),
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
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30, left: 30),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: index % 2 == 0
                                      ? Colors.white
                                      : Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ListTile(
                                  leading: SizedBox(
                                    width: 100, // Adjust image width as needed
                                    // height:
                                    //     100
                                    //     , // Adjust image height as needed
                                    child: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          products[index].imagePath,
                                          fit: BoxFit
                                              .cover, // Adjust the fit as needed
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text(products[index].name),
                                  subtitle: Text(
                                      '\$${products[index].price.toStringAsFixed(2)}'),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.add),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RestaurentMenu()),
                          );

                          // Add functionality to see more
                        },
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'See our menu',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 241, 45, 38),
                            ),
                          ),
                        ),
                      ),
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
