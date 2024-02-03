import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:foodyapp/features/authentication/screens/login_screen.dart';
import 'package:foodyapp/features/authentication/screens/navigation_manu.dart'; // Import the dots indicator package

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              _buildOnboardingScreen(
                context,
                const Color.fromARGB(255, 255, 210, 0),
                const Color.fromARGB(255, 255, 255, 255),
                "assets/images/onboarding_images/popcorn.png",
                "Choose A Tasty Dish",
                "Order anything you want from your Favorite restaurant.",
              ),
              _buildOnboardingScreen(
                context,
                const Color.fromARGB(255, 255, 210, 0),
                Colors.white,
                "assets/images/onboarding_images/payment.png",
                "Easy Payment",
                "Payment made easy through debit card, credit card & more ways to pay for your food",
              ),
              _buildOnboardingScreen(
                context,
                const Color.fromARGB(255, 255, 210, 0),
                Colors.white,
                "assets/images/onboarding_images/taste.png",
                "Enjoy the Taste!",
                "Healthy eating means eating a variety of foods that give you the nutrients you need to maintain your health.",
              ),
            ],
          ),
          Positioned(
            bottom: 50.0,
            //left: 20.0,
            right: 120,
            child: SizedBox(
              height: 50,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage < 2) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  } else {
                    // Navigate to the next screen or perform the necessary action
                    // when the user finishes the onboarding.
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(
                      255, 255, 255, 255), // Choose your preferred button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(_currentPage == 2 ? 'Finish' : 'Next'),
              ),
            ),
          ),
          Positioned(
            bottom: 50.0,
            //left: 120.0,
            right: 20,
            child: TextButton(
              onPressed: () {
                // Navigate to the next screen or perform the necessary action
                // when the user skips the onboarding.
                _pageController.jumpToPage(2);
              },
              child: const Text("Skip"),
            ),
          ),
          Positioned(
            bottom: 300.0,
            left: 0,
            right: 0,
            child: DotsIndicator(
              dotsCount: 3, // Number of onboarding screens
              position: _currentPage.toDouble(),
              decorator: const DotsDecorator(
                color: Colors.grey, // Inactive dot color
                activeColor:
                    Color.fromARGB(255, 255, 210, 0), // Active dot color
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingScreen(
    BuildContext context,
    Color primaryColor,
    Color backgroundColor,
    String imagePath,
    String title,
    String description,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: BoxDecoration(
              color: primaryColor,
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(70)),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        imagePath,
                        width: 250,
                        height: 250,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(70)),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(70)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
