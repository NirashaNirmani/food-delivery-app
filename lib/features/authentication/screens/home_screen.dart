import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 236, 241),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 210, 0),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(70)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                hintStyle: TextStyle(fontSize: 15),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  const Row(
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Icon(Icons.location_on,
                            size: 35), // Adjust size here
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Home',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '242, Market place, Finland',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      SizedBox(width: 60),
                      Column(
                        children: [
                          Icon(Icons.menu_open_outlined),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildIconButton(Icons.fastfood_outlined, 'All'),
                      _buildIconButton(Icons.local_pizza_outlined, 'Pizza'),
                      _buildIconButton(Icons.local_drink_sharp, 'Beverages'),
                      _buildIconButton(
                          Icons.radio_button_checked_outlined, 'Asian'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Nearest Restaurents",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildElevatedButton('Container 1',
                            'assets/images/home/noodless.jpg', 'Westway'),
                        const SizedBox(width: 12),
                        _buildElevatedButton('Container 2',
                            'assets/images/home/noodless.jpg', 'Fortune'),
                        const SizedBox(width: 12),
                        _buildElevatedButton('Container 3',
                            'assets/images/home/noodless.jpg', 'Seafood'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildElevatedButton('Container 1',
                            'assets/images/home/noodless.jpg', 'Westway'),
                        const SizedBox(width: 12),
                        _buildElevatedButton('Container 2',
                            'assets/images/home/noodless.jpg', 'Fortune'),
                        const SizedBox(width: 12),
                        _buildElevatedButton('Container 3',
                            'assets/images/home/noodless.jpg', 'Seafood'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _buildIconButton(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        // Handle button tap
      },
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color.fromARGB(255, 138, 136, 136)),
          ),
          const SizedBox(height: 8), // Adjust spacing between icon and label
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildElevatedButton(
    String label,
    String imagePath,
    String text1,
  ) {
    return ElevatedButton(
      onPressed: () {
        // Handle button tap
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
        primary: const Color.fromARGB(255, 208, 214, 219),
      ),
      child: Container(
        width: 130,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                height: 120,
                width: 130,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Text(
                text1,
                style: const TextStyle(fontSize: 22, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
