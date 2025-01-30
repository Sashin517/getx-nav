import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'page1.dart';
import 'page2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      init: NavigationController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: const Text('Bottom Navigation with GetX')),
          body: controller.pages[controller.currentIndex.value], // Display active page
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.changePage(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.pageview), label: "Page 1"),
              BottomNavigationBarItem(icon: Icon(Icons.pages), label: "Page 2"),
            ],
          ),
        );
      },
    );
  }
}

// Controller to manage bottom navigation state
class NavigationController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> pages = [
    const Center(child: Text("Home Screen", style: TextStyle(fontSize: 22))),
    const Page1(),
    const Page2(),
  ];

  void changePage(int index) {
    currentIndex.value = index;
    update(); // Refresh UI
  }
}
