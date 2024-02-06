import 'package:flutter/material.dart';
import 'package:foodyapp/features/authentication/screens/home_screen.dart';
import 'package:foodyapp/features/authentication/screens/restaurent_deails.dart';
import 'package:foodyapp/features/authentication/screens/restaurent_menu.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    //final darkMode = EHelperFunctions.isDarkMode(context);
    return Scaffold(
        bottomNavigationBar: Obx(() => NavigationBar(
                height: 60,
                elevation: 0,
                backgroundColor: Color.fromARGB(244, 255, 255, 255),
                indicatorColor: Colors.white.withOpacity(0),
                selectedIndex: controller.selectedIndex.value,
                onDestinationSelected: (index) =>
                    controller.selectedIndex.value = index,
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Iconsax.home,
                        color: Color.fromARGB(255, 163, 163, 163)),
                    label: " ",
                  ),
                  NavigationDestination(
                      icon: Icon(Iconsax.search_favorite,
                          color: Color.fromARGB(255, 163, 163, 163)),
                      label: " "),
                  NavigationDestination(
                      icon: Icon(Iconsax.bag5,
                          color: Color.fromARGB(255, 163, 163, 163)),
                      label: " "),
                  NavigationDestination(
                      icon: Icon(Iconsax.user,
                          color: Color.fromARGB(255, 163, 163, 163)),
                      label: " "),
                ])),
        body: Obx(
          () => controller.screens[controller.selectedIndex.value],
        ));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    RestaurentDetails(),
    RestaurentMenu(),

    //const Details(),
  ];
}
