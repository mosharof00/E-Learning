import 'package:elearning/app/modules/fees/widgets/feescards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/custom_appbar.dart';
import '../controllers/fees_controller.dart';

class FeesView extends GetView<FeesController> {
  const FeesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        // iconImage: Assets.images.fees,
        title: 'Fees',
        elevation: 0,
      ),
      body: Container(color: Colors.grey.shade200, child: const FeesCards()),
    );
  }
}
