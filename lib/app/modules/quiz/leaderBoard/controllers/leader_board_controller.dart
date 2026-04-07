import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LeaderBoardController extends GetxController with GetSingleTickerProviderStateMixin{
  //TODO: Implement LeaderBoardController

  final count = 0.obs;
  late AnimationController _controller;
  late Animation<double> animation;

  void _startAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = Tween<double>(
      begin: 0.9,
      end: 1.2,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
  }
  @override
  void onInit() {
    _startAnimation();
    super.onInit();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

 TextEditingController searchController = TextEditingController();
}
