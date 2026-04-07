import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../helper/helper_utils.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/messages_controller.dart';

class MessagesView extends GetView<MessagesController> {
  const MessagesView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MessagesController());

    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('conversation')
                .doc(controller.currentUserId)
                .collection(controller.currentUserId)
                .orderBy('time', descending: true)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots) {
              if (!snapshots.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<DocumentSnapshot> conversations = snapshots.data!.docs;

              if (conversations.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppTextStyle(
                        text: "Recent chat is empty",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.black54 // Background color
                              ),
                          onPressed: () {
                            // Get.to(() => const FansFriendPage());
                          },
                          child: AppTextStyle(
                            text: "Find Friends",
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: conversations.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot conversation = conversations[index];
                    String otherUserID = conversation.id;

                    return StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Users')
                          .doc(otherUserID)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasData && snapshot.data != null) {
                          bool isOnline = snapshot.data!['isOnline'];
                          // String deviceToken = snapshot.data!['deviceToken'];
                          //  bool msgSeen = (snapshot.data!.data() as Map<String, dynamic>).containsKey('msgSeen') ? snapshot.data!['msgSeen'] : false;
                          bool msgSeen = conversation['msgSeen'];
                          bool isMe = conversation['senderID'] ==
                              controller.currentUserId;

                          String username = snapshot.data!['name'];
                          String lastMessage = conversation['lastMessage'];
                          // String? userImage = snapshot.data!['image'];
                          Timestamp lastMessageTimestamp =
                              conversation['time'] ?? Timestamp.now();

                          //userList.add(ChatUserModel(userID:otherUserID,name:username,userDP: userImage,lastMessage: lastMessage));

                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            color: msgSeen
                                ? Colors.white24
                                : isMe
                                    ? Colors.white24
                                    : Colors.blue.shade50,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Stack(
                                    children: [
                                      snapshot.data!['image'] == null
                                          ? CircleAvatar(
                                              backgroundColor: Colors.blue,
                                              radius: 25.0,
                                              child: AppTextStyle(
                                                text: username[0].toUpperCase(),
                                                fontSize: 25,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            )
                                          : CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  snapshot.data!['image']),
                                              radius: 25,
                                            ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: CircleAvatar(
                                          backgroundColor: isOnline
                                              ? Colors.green
                                              : Colors.grey,
                                          radius: 6.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  title: AppTextStyle(
                                    text: username,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                  subtitle: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3.0),
                                        child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth: 0.7.sw,
                                            ),
                                            child: AppTextStyleOverFlow(
                                                text: lastMessage,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: AppTextStyle(
                                            text: HelperUtils.formatTimestamp(
                                                    lastMessageTimestamp),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Get.toNamed(Routes.CHATS,
                                        arguments: otherUserID);
                                    //Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //     builder: (context) => ChatScreen(
                                    //       currentUserID: widget.currentUserID,
                                    //       otherUserID: otherUserID,
                                    //       token: deviceToken,
                                    //       userName: username,
                                    //     ),
                                    //   ),
                                    // );
                                    // FirebaseDB.updateMessageSeenStatus(widget.currentUserID, otherUserID);
                                  },
                                  /*   onLongPress: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext) {
                                          return Container(
                                            height: 150,
                                            color: Colors.transparent,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10.0),
                                                  topRight: Radius.circular(10.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    InkWell(
                                                      onTap: () async {
                                                        ArtDialogResponse response = await ArtSweetAlert.show(
                                                            barrierDismissible: false,
                                                            context: context,
                                                            artDialogArgs: ArtDialogArgs(
                                                                denyButtonText: "Cancel",
                                                                title: "Are you sure?",
                                                                text: "You won't be able to revert this!",
                                                                confirmButtonText: "Yes, delete it",
                                                                type: ArtSweetAlertType.warning));

                                                        if (response == null) {
                                                          return;
                                                        }

                                                        if (response.isTapConfirmButton) {
                                                          Navigator.pop(context);
                                                          ArtSweetAlert.show(context: context, artDialogArgs: ArtDialogArgs(type: ArtSweetAlertType.success, title: "Deleted!"));

                                                          FirebaseDB.deleteConversation(widget.currentUserID, otherUserID, FirebaseDB.getChatId(widget.currentUserID, otherUserID));
                                                          Navigator.pop(context);
                                                          return;
                                                        }
                                                        Navigator.pop(context);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget>[
                                                          IconButton(
                                                            onPressed: () {},
                                                            icon: const Icon(Icons.delete),
                                                          ),
                                                          AppTextStyle('Delete', 15, FontWeight.w600),
                                                        ],
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () async {
                                                        ArtDialogResponse response = await ArtSweetAlert.show(
                                                            barrierDismissible: false,
                                                            context: context,
                                                            artDialogArgs: ArtDialogArgs(
                                                                denyButtonText: "Cancel",
                                                                title: "Are you sure?",
                                                                text: "You want block this!",
                                                                confirmButtonText: "Yes, Block",
                                                                type: ArtSweetAlertType.warning));

                                                        if (response == null) {
                                                          return;
                                                        }

                                                        if (response.isTapConfirmButton) {
                                                          Navigator.pop(context);
                                                          ArtSweetAlert.show(context: context, artDialogArgs: ArtDialogArgs(type: ArtSweetAlertType.success, title: "Blocked!"));

                                                          FirebaseDB.blockUnblockUser(FirebaseDB.getChatId(widget.currentUserID, otherUserID), widget.currentUserID, true);
                                                          Navigator.pop(context);
                                                          return;
                                                        }
                                                        Navigator.pop(context);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget>[
                                                          IconButton(
                                                            onPressed: () {},
                                                            icon: const Icon(Icons.block),
                                                          ),
                                                          AppTextStyle('Block', 15, FontWeight.w600),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  },*/
                                ),
                                // Divider(height: 0.5,)
                              ],
                            ),
                          );
                        } else {
                          return AppTextStyle(
                              text: "You have no friend",
                              fontSize: 15,
                              fontWeight: FontWeight.w600);
                        }
                      },
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );

    // return Scaffold(
    //   body: ListView.builder(
    //       padding: const EdgeInsets.only(top: 10),
    //       itemCount: users.length,
    //       itemBuilder: (context, index) {
    //         User user = users[index];
    //         return InkWell(
    //           onTap: () {
    //             Get.toNamed(Routes.CHATS, arguments: user.id);
    //           },
    //           child: Padding(
    //             padding: const EdgeInsets.only(bottom: 15.0),
    //             child: Row(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Expanded(
    //                   flex: 1,
    //                   child: CircleAvatar(
    //                       radius: 30,
    //                       backgroundImage:
    //                           CachedNetworkImageProvider(user.imageUrl)),
    //                 ),
    //                 Expanded(
    //                   flex: 3,
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           AppTextStyle(
    //                               text: user.name,
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.w500),
    //                           Padding(
    //                             padding:
    //                                 const EdgeInsets.symmetric(horizontal: 8.0),
    //                             child: AppTextStyle(
    //                                 text: '12:00 PM', color: Colors.grey),
    //                           ),
    //                         ],
    //                       ),
    //                       const SizedBox(
    //                         height: 7,
    //                       ),
    //                       AppTextStyleOverFlow(
    //                           text: 'Hello, How are you?', color: Colors.grey),
    //                       Divider(
    //                         color: Colors.grey.shade400,
    //                         thickness: 0.1,
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         );
    //       }),
    // );
  }
}
