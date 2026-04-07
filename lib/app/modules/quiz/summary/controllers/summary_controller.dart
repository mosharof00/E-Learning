import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SummaryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> bounceAnimation;

  late final RxDouble _animationValue = 30.0.obs;
  RxDouble get animationValue => _animationValue;

  @override
  void onInit() {
    super.onInit();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    bounceAnimation =
        Tween<double>(begin: 0.0, end: _animationValue.value).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutQuad,
      ),
    );

    _controller.repeat(reverse: true);
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }
}
