import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'page1.dart';
import 'page2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Drawer Navigation with GetX")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Navigation Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Get.offAll(() => const HomeScreen()), // Go to Home
            ),
            ListTile(
              leading: const Icon(Icons.pageview),
              title: const Text('Page 1'),
              onTap: () => Get.to(() => const Page1()), // Go to Page1
            ),
            ListTile(
              leading: const Icon(Icons.pages),
              title: const Text('Page 2'),
              onTap: () => Get.to(() => const Page2(), arguments: {'message': 'Hello from Home!'}), // Go to Page2 with message
            ),
          ],
        ),
      ),
      body: const Center(child: Text("Welcome to Home Screen", style: TextStyle(fontSize: 22))),
    );
  }
}
