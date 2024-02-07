import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [
    CartItem('Burger with some', '\$10.00', 'assets/images/cart/1 image.png'),
    CartItem('Burger with some', '\$15.00', 'assets/images/cart/2 image.png'),
    CartItem('Burger with some', '\$20.00', 'assets/images/cart/3 image.png'),
    CartItem('Burger with some', '\$25.00', 'assets/images/cart/1 image.png'),
  ];
  double itemTotal = 0;
  double discount = 0; // Add your discount logic here
  double tax = 0; // Add your tax logic here
  double total = 0;

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
      updateCart();
    });
  }

  void updateCart() {
    itemTotal = 0;
    cartItems.forEach((item) {
      itemTotal += double.parse(
          item.price.substring(1)); // Assuming price format is '$xx.xx'
    });

    // Recalculate total based on the updated itemTotal, discount, and tax
    total = itemTotal - discount + tax;
  }

  @override
  Widget build(BuildContext context) {
    double itemTotal = 0;
    cartItems.forEach((item) {
      itemTotal += double.parse(
          item.price.substring(1)); // Assuming price format is '$xx.xx'
    });

    double discount = 0; // Add your discount logic here
    double tax = 0; // Add your tax logic here
    double total = itemTotal - discount + tax;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 210, 0),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 237, 236, 241),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(70)),
                ),
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        const SizedBox(width: 90),
                        const Center(
                          child: Text(
                            "Cart",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 112, 0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 50,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Deliver to",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 100),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 255, 112, 0),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "123 Main Street",
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          return _buildCartItem(cartItems[index], index);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 237, 236, 241),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 210, 0),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
                ),
                padding: const EdgeInsets.all(50),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCartItem2('Item Total:', '\$100.00'),
                      SizedBox(
                        height: 20,
                      ),
                      _buildCartItem2('Discount: -\$10.00', '\$10.00'),
                      SizedBox(
                        height: 20,
                      ),
                      _buildCartItem2('Tax: ', '\$2.00'),
                      SizedBox(
                        height: 20,
                      ),
                      _buildCartItem2('Total:', '\$95.00'),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Add your onPressed logic here
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(500, 70),
                          primary: const Color.fromARGB(
                              255, 236, 236, 236), // Background color
                          onPrimary: Colors.white, // Text color
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 32), // Button padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20), // Button border radius
                          ),
                        ),
                      ),
                    ]),

                // child: const Column(

                //   // children: [
                //   //   Row(
                //   //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   //     children: [
                //   //       Text("Item Total:"),
                //   //       Text("\$100.00"),
                //   //     ],
                //   //   ),
                //   //   SizedBox(
                //   //     width: 10,
                //   //   ),
                //   //   Row(
                //   //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   //     children: [
                //   //       Text("Discount: -\$10.00"),
                //   //       Text("\$10.00"),
                //   //     ],
                //   //   ),
                //   //   Row(
                //   //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   //     children: [
                //   //       Text("Tax: "),
                //   //       Text("\$2.00"),
                //   //     ],
                //   //   ),
                //   //   Row(
                //   //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   //     children: [
                //   //       Text("Total: \$95.00"),
                //   //       Text("\$12.49"),
                //   //     ],
                //   //   ),
                //   // ],
                // )),
                // child: ListView.builder(
                //   itemCount: cartItems.length,
                //   itemBuilder: (context, index) {
                //     final item = cartItems[index];
                //     return ListTile(
                //       title: Text(item.name),
                //       subtitle: Text(item.price),
                //     );
                //   },
                // ),
              ),

              // Add the item total, discount, tax, and total below the screen
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(CartItem item, int index) {
    return Column(
      children: [
        const SizedBox(
          height: 10, // Adjust the height as per your requirement
        ),
        SizedBox(
          height: 100,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        item.imagePath,
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(item.name),
                        Text(item.price),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            // Implement decrement logic
                          },
                        ),
                        const Text('1'), // Display item count
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            // Implement increment logic
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    removeItem(index);
                  },
                  iconSize: 15,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCartItem2(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Text(value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class CartItem {
  final String name;
  final String price;
  final String imagePath;

  CartItem(this.name, this.price, this.imagePath);
}
