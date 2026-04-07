import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/single_user_quiz_controller.dart';

class SingleUserQuizView extends GetView<SingleUserQuizController> {
  const SingleUserQuizView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleUserQuizView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SingleUserQuizView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
