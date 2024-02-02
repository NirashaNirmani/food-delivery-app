import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();
    int _currentPage = 0;

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
                      BorderRadius.only(bottomRight: Radius.circular(70)),
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
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
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
                      BorderRadius.only(bottomRight: Radius.circular(70)),
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
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              _currentPage = page;
            },
            children: [
              _buildOnboardingScreen(
                context,
                Color.fromARGB(255, 255, 210, 0),
                Color.fromARGB(255, 255, 255, 255),
                "assets/images/onboarding_images/popcorn.png",
                "Choose A Tasty Dish",
                "Order anything you want from your Favorite restaurant.",
              ),
              _buildOnboardingScreen(
                context,
                Color.fromARGB(255, 255, 210, 0),
                Colors.white,
                "assets/images/onboarding_images/payment.png",
                "Easy Payment",
                "Payment made easy through debit card, credit card & more ways to pay for your food",
              ),
              _buildOnboardingScreen(
                context,
                Color.fromARGB(255, 255, 210, 0),
                Colors.white,
                "assets/images/onboarding_images/taste.png",
                "Enjoy the Taste!",
                "Healthy eating means eating a variety of foods that give you the nutrients you need to maintain your health.",
              ),
            ],
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage < 2) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                } else {
                  // Navigate to the next screen or perform the necessary action
                  // when the user finishes the onboarding.
                }
              },
              child: Text(_currentPage == 2 ? 'Finish' : 'Next'),
            ),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: TextButton(
              onPressed: () {
                // Navigate to the next screen or perform the necessary action
                // when the user skips the onboarding.
                _pageController.jumpToPage(2);
              },
              child: Text("Skip"),
            ),
          ),
        ],
      ),
    );
  }
}
