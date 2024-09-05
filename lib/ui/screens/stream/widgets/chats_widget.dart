import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../models/models.dart';
import '../../../../providers/providers.dart';
import '../../../../utils/utils.dart';
import '../../../painters/painters.dart';
import 'widgets.dart'; // import this

class ChatsWidget extends StatelessWidget {
  const ChatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = context.watch<ChatMessagesProvider>().messages;
    final currentUser = context.watch<TabCProvider>().currentUser;
    Map<String, List<MessageModel>> groupMessagesByDate() {
      Map<String, List<MessageModel>> groupedMessages = {};
      for (var message in messages) {
        final dateKey =
            '${message.timeStamp.year}-${message.timeStamp.month < 10 ? '0${message.timeStamp.month}' : message.timeStamp.month}-${message.timeStamp.day < 10 ? '0${message.timeStamp.day}' : message.timeStamp.day}';
        if (!groupedMessages.containsKey(dateKey)) {
          groupedMessages[dateKey] = [];
        }
        groupedMessages[dateKey]!.add(message);
      }
      return groupedMessages;
    }

    final groupedMessages = groupMessagesByDate();
    final dateKeys = groupedMessages.keys.toList()
      ..sort((a, b) => b.compareTo(a));
    return ListView.builder(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 150),
        reverse: true,
        itemBuilder: (context, index) {
          final dateKey = dateKeys[index];
          final dateMessages = groupedMessages[dateKey]!.reversed.toList();
          final formattedDate =
              DateFormat.yMMMMd().format(DateTime.parse(dateKey));
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  formattedDate,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 12,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              ...dateMessages.map(
                (msg) => msg.idFrom == currentUser
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: ClipPath(
                            clipper: MsgPainter(
                              type: BubbleType.sendBubble,
                            ),
                            child: TextMessageWidget(
                              type: BubbleType.sendBubble,
                              message: msg,
                            ),
                          ),
                        ),
                      )
                    : Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            UserWidget(
                              user: msg.idFrom,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UserNameWidget(
                                  user: msg.idFrom,
                                  isMe: false,
                                ),
                                ClipPath(
                                  clipper: MsgPainter(
                                      type: BubbleType.receiverBubble),
                                  child: TextMessageWidget(
                                    type: BubbleType.receiverBubble,
                                    message: msg,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
              )
            ],
          );
        },
        itemCount: dateKeys.length);
  }
}

class UserWidget extends StatelessWidget {
  final String user;
  const UserWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final users = context.read<TabCProvider>().users;
    final sender = users.firstWhere((element) => element.uid == user);
    String name = sender.displayname;
    return CircleAvatar(
      radius: 12,
      child: Text(name[0].toUpperCase()),
    );
  }
}

class UserNameWidget extends StatelessWidget {
  final String user;
  final bool isMe;
  const UserNameWidget({super.key, required this.user, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final users = context.read<TabCProvider>().users;
    final sender = users.firstWhere((element) => element.uid == user);
    String name = sender.displayname.split(' ')[0];
    return Padding(
      padding: EdgeInsets.only(
          left: !isMe ? 12 : 0, right: isMe ? 12 : 0, bottom: 3, top: 10),
      child: Text(
        name,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontSize: 12, color: Colors.grey),
      ),
    );
  }
}
