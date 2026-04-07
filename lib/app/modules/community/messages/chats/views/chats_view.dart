import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:elearning/services/firebase_db_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../helper/helper_utils.dart';
import '../../../../../routes/app_pages.dart';
import '../controllers/chats_controller.dart';

class ChatsView extends GetView<ChatsController> {
  ChatsView({
    super.key,
  });
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.bgColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance.collection('Users').doc(controller.otherUserID).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> userSnapshot) {
                if (userSnapshot.hasData && userSnapshot.data != null) {
                  bool isOnline = userSnapshot.data![FBAtt.isOnline.name];
                  // return CircleAvatar(
                  //   backgroundColor: isOnline ? Colors.green : Colors.grey,
                  //   radius: 20.0,
                  //   child: Text(
                  //     snapshot.data!['Name'][0].toUpperCase(),
                  //     style: const TextStyle(
                  //       fontSize: 18.0,
                  //     ),
                  //   ),
                  // );
                  return Row(
                    children: [
                      userSnapshot.data!['image'] == null
                          ? CircleAvatar(
                        backgroundColor: isOnline ? Colors.green : Colors.grey,
                        radius: 20.0,
                        child: Text(
                          userSnapshot.data!['name'][0].toUpperCase(),
                          style: const TextStyle(fontSize: 18.0, overflow: TextOverflow.ellipsis),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                          : CircleAvatar(
                        backgroundImage: NetworkImage(userSnapshot.data!['image']),
                        radius: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: SizedBox(
                              width: 0.5.sw,
                              child: AppTextStyleOverFlow(text:'${userSnapshot.data!['name']}',fontSize: 15,fontWeight: FontWeight.w700, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: StreamBuilder<DocumentSnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('conversation')
                                  .doc(controller.currentUserID)
                                  .collection(controller.currentUserID!)
                                  .doc(controller.otherUserID)
                                  .snapshots(),
                              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasData && snapshot.data!.exists) {
                                  bool isTyping = snapshot.data!['isTyping'];
                                  // bool inChatstatus = snapshot.data!['inChat'];
                                  //FirebaseDB.inChatstatus = inChatstatus;
                                  return isTyping
                                      ? Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Row(
                                      children: [
                                        AppTextStyle(text: "Typing...", fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white),
                                      ],
                                    ),
                                  )
                                      : Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: AppTextStyle(text:
                                        isOnline ? "Online" : "Last seen ${HelperUtils.formatTimestamp(userSnapshot.data!['time'])}",fontSize: 10, fontWeight: FontWeight.w700,color: Colors.white54),
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: ColorName.primary,
          ),
        ),
        actions: <Widget> [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert,color: Colors.white), // add this line

            onSelected: (result) {
              if (result == 0) {
                Get.toNamed(Routes.TEACHER_PROFILE);
              }
            },

            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            offset: const Offset(0, 45),
            // SET THE (X,Y) POSITION
            iconSize: 30,
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  // Navigator inside PopupMenuItem does not work it pop after push
                  value: 0,
                  child: Text('View profile'),
                ),

              ];
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child:  StreamBuilder(
              stream: FirebaseDBService.getMessages(
                  controller.currentUserID!, controller.otherUserID!),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                var messages = snapshot.data!.docs;
                FirebaseDBService.messages = messages;
                List<Widget> messageWidgets = [];
                for (var message in messages) {
                  final messageText = message[FBAtt.text.name];
                  final messageSender = message[FBAtt.senderId.name];

                  final messageWidget = MessageBubble(
                    sender: messageSender,
                    text: messageText,
                    isMe: messageSender ==
                        controller
                            .currentUserID, // Assume we're only chatting with one other person
                  );
                  messageWidgets.add(messageWidget);
                }

                return ListView(
                  reverse: true,
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
                  children: messageWidgets,
                );
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      constraints: const BoxConstraints(
        maxHeight: 300.0,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              onChanged: (String text) {},
              maxLines: 3,
              minLines: 1,
              //onSubmitted: _handleSubmitted,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: const Icon(Icons.attach_file),
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0.1),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: "Send a message",
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.send,
              color: Colors.grey,
            ),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    FirebaseDBService.sendMessage(
        controller.currentUserID!, controller.otherUserID!, FILETYPE.text.name,
        msg: text);
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.sender, required this.text, required this.isMe});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxWidth: 0.75.sw,
            ),
            decoration: BoxDecoration(
              color: isMe ? ColorName.primary : Colors.grey[200],
              borderRadius: isMe
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    )
                  : const BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15.0,
                  color: isMe ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
