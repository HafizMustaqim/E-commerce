import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
// import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // Update current Index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  //Jump to specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  //Update current Index & jump to next page
  void nextPage() {
    if(currentPageIndex.value == 2){
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  //Update current Index & jump to last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}