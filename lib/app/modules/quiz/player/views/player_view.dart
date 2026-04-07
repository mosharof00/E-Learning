import 'package:elearning/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../global/custom_appbar.dart';
import '../../contestLeaderboard/widget/leader_list.dart';
import '../controllers/player_controller.dart';

class PlayerView extends GetView<PlayerController> {
  const PlayerView({super. key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorName.white,
      appBar: CustomAppbar(
        title: 'All Players',
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top:8.0),
        child: LeaderList(),
      ),
    );
  }
}
