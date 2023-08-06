import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_navigation_controller.dart';

class BottomNavigation extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final List<Widget> pages;
  final int initialPage;

  const BottomNavigation({super.key, 
    required this.items,
    required this.pages,
    this.initialPage = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
        index: Get.find<BottomNavigationController>().currentIndex.value,
        children: pages,
      )),

      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: Get.find<BottomNavigationController>().currentIndex.value,
        items: items,
        onTap: (index) {
          Get.find<BottomNavigationController>().changePage(index);
        },
      )),

    );
  }
}


