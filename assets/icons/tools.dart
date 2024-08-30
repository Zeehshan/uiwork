import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../blocs/blocs.dart';
import '../configs/apis/apis.dart';
import '../configs/routes/router_v2.dart';
import '../data/repositories/chat_repository.dart';
import '../models/models/models.dart';
import 'utils.dart';

class Tools {
  // static numberFormat(String amount) {
  //   return NumberFormat.compactCurrency(decimalDigits: 1, symbol: '')
  //       .format(double.parse(amount));
  // }

  static String numberFormat(String amount) {
    return NumberFormat.compact().format(double.parse(amount));
  }

  static formattedSeconds({required int seconds}) {
    Duration duration = Duration(seconds: seconds);
    return '${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(duration.inSeconds.remainder(60)).toString().padLeft(2, '0')}';
  }

  static chatDocumentId({
    required String from,
    required String to,
  }) {
    String? documentId;
    if (from.hashCode <= to.hashCode) {
      documentId = '$from-$to';
    } else {
      documentId = '$to-$from';
    }
    return documentId;
  }

  static String formatCount(int count) {
    return NumberFormat.compact().format(count);
  }

  Color getRandomColor(int index) {
    Random random = Random(index); // Initialize Random with the index
    int red =
        random.nextInt(256); // Generate random values for red, green, and blue
    int green = random.nextInt(256);
    int blue = random.nextInt(256);
    return Color.fromARGB(255, red, green, blue); // Return a Color object
  }

  static formatTimeAgo(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inDays > 365) {
      return DateFormat('MMM d, y').format(time);
    } else if (difference.inDays >= 2) {
      return DateFormat('MMM d').format(time);
    } else if (difference.inDays >= 1) {
      return '1 d';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} h';
    } else if (difference.inHours >= 1) {
      return '1 h';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} min';
    } else if (difference.inMinutes >= 1) {
      return '1 min';
    } else {
      return 'Just now';
    }
  }

  // Function to check if the given path is a video.
  static bool isVideo(String path) {
    // List of common video file extensions.
    const videoExtensions = ['mp4', 'avi', 'mov', 'mkv', 'flv', 'wmv', 'webm'];

    // Extract the file extension from the path.
    String extension = path.split('.').last.toLowerCase();

    // Check if the file extension is in the list of video extensions.
    return videoExtensions.contains(extension);
  }

  static List<List<int>> createUsersSublists(
      List<int> inputList, int sublistSize) {
    List<List<int>> sublists = [];
    for (int i = 0; i < inputList.length; i += sublistSize) {
      try {
        final sublist = inputList.sublist(i, i + sublistSize);
        sublists.add(sublist);
      } catch (e) {
        final sublist = inputList.sublist(i);
        sublists.add(sublist);
      }
    }
    return sublists;
  }

  static Map<String, dynamic> createSingleLocalMsg({
    required int? conversationId,
    required int senderId,
    required int creatorId,
    String? text,
    required MessageV2Type type,
    String? video,
    String? image,
    String? thumbnail,
    String? base64,
    String? voice,
    String? file,
    String? sticker,
    List<double>? waveData,
    int? duration,
    String? fileName,
    int? fize,
    UserModel? reciver,
    required ChatV2Type chatType,
    List<UserModel> groupUsers = const [],
    double? imageWidth,
    double? imageHeight,
    String? parentId,
    String? grooupTitle,
    String? groupInfo,
    StreamDataModel? session,
    List<int>? removedUsers,
    int? addedUser,
    int? removedUser,
    int? leftedUser,
    String? localId,

    /// when forwarding and local datas not avaialabel but remote data available
    String? remoteThumbnail,
    String? remote,
  }) {
    final dateTime = DateTime.now();
    String sortKey = localId ?? dateTime.millisecondsSinceEpoch.toString();
    int conveId = conversationId ?? (senderId.hashCode + reciver.hashCode);
    final fileData = {
      'local': type == MessageV2Type.video
          ? video
          : type == MessageV2Type.voice
              ? voice
              : type == MessageV2Type.file
                  ? file
                  : type == MessageV2Type.image
                      ? image
                      : null,
      if (type == MessageV2Type.file) 'name': fileName,
      if (remoteThumbnail != null) 'remoteThumbnail': remoteThumbnail,
      if (remote != null) 'remote': remote,
      if (type == MessageV2Type.video) 'localThumbnail': thumbnail,
      if (type == MessageV2Type.file) 'size': fize,
      if (type == MessageV2Type.voice) 'wavedFormData': waveData,
      if (type == MessageV2Type.voice) 'duration': duration,
      if (type == MessageV2Type.sticker) 'sticker': sticker,
      if (imageWidth != null) 'imageWidth': imageWidth,
      if (imageHeight != null) 'imageHeight': imageHeight,
      if (type == MessageV2Type.video || type == MessageV2Type.image)
        'base64Image': base64,
    };
    final sender = BlocProvider.of<AuthenticationBloc>(navigator.context)
        .state
        .singleUser!
        .user;
    return {
      'id': conveId,
      'payload': {
        'type': chatType.name,
        if (chatType == ChatV2Type.group)
          'groupUsers': groupUsers
              .map(
                (u) => {
                  'id': u.id,
                  'picture': u.picture,
                  'fullname': u.fullname,
                },
              )
              .toList(),
        if (chatType == ChatV2Type.group) 'title': grooupTitle,
        if (chatType == ChatV2Type.group) 'info': groupInfo,
        'removedUsers': removedUsers,
      },
      'creatorId': creatorId,
      'message': {
        'conversationId': conveId,
        'notification': true,
        'payload': {
          if (type == MessageV2Type.text) 'text': text,
          'localSortKey': sortKey,
          'localConveId': conversationId == null ? conveId.toString() : null,
          'messageType':
              text != null && ChatRepository().isValidLink(link: text)
                  ? MessageV2Type.link.name
                  : type.name,
          'parentId': parentId,
          'senderUser': {
            'id': sender.id,
            'picture': sender.picture,
            'fullname': sender.fullname,
          },
          if (chatType == ChatV2Type.single)
            'recieverUser': {
              'id': reciver!.id,
              'picture': reciver.picture,
              'fullname': reciver.fullname,
            },
          'file': {
            if (type == MessageV2Type.video) 'video': fileData,
            if (type == MessageV2Type.image) 'image': fileData,
            if (type == MessageV2Type.voice) 'voice': fileData,
            if (type == MessageV2Type.file) 'file': fileData,
            if (type == MessageV2Type.sticker) 'sticker': fileData,
          },
          if (type == MessageV2Type.missedDirectSession ||
              type == MessageV2Type.sessionCreated)
            'session': session?.toJson(),
          if (type == MessageV2Type.lefted) 'leftedUser': leftedUser!,
          if (type == MessageV2Type.groupUserRemoved)
            'removedUser': removedUser!,
          if (type == MessageV2Type.groupUserAdded) 'addedUser': addedUser!,
        },
        'senderId': senderId,
        if (chatType == ChatV2Type.single) 'receiverId': reciver!.id,
        'sortKey': sortKey,
        'createdAt': dateTime.millisecondsSinceEpoch,
        'localCreatedAt': dateTime.millisecondsSinceEpoch,
      },
      if (chatType == ChatV2Type.single)
        'user': {
          'userId': reciver!.id,
          'type': 'user',
        },
      if (chatType == ChatV2Type.group)
        'users': groupUsers
            .map(
              (u) => {
                'userId': u.id,
                'type': 'user',
              },
            )
            .toList()
    };
  }

  // static Map<String, dynamic> createGroupLocalMsg() {}

  static String formatDate(DateTime date) {
    // Define the date format
    DateFormat formatter = DateFormat('M/d/yyyy, h:mm:ss a');
    // Format the date
    return formatter.format(date);
  }

  static String removeDotFromExtension(String fileName) {
    // Get the file extension
    String extension = fileName.split('.').last;

    // If the file has an extension, remove the dot
    if (fileName.contains('.')) {
      return fileName.replaceAll('.$extension', extension);
    }

    // If there is no extension, return the original file name
    return fileName;
  }

  static String chatMessage(
    PayloadModel payload,
    int currentUser, {
    ChatModel? chat,
  }) {
    String message = '';
    switch (payload.messageType) {
      case MessageV2Type.text:
        message = payload.text ?? '';
        break;
      case MessageV2Type.command:
        message = payload.text!;
        break;
      case MessageV2Type.image:
        message = 'Image';
        break;
      case MessageV2Type.video:
        message = 'Video';
        break;
      case MessageV2Type.sticker:
        message = 'Sticker';
        break;
      case MessageV2Type.imogi:
        message = 'Imogi';
        break;
      case MessageV2Type.voice:
        message = 'Voice';
        break;
      case MessageV2Type.file:
        message = payload.file!.file!.name!;
        break;
      case MessageV2Type.unknown:
        break;
      case MessageV2Type.sessionCreated:
        message = 'New session creeated';
        break;
      case MessageV2Type.missedDirectSession:
        message = 'Direct session started';
        break;
      case MessageV2Type.lefted:
        if (payload.senderUser?.id == currentUser) {
          message = 'you lefted';
        } else {
          message =
              '${payload.senderUser?.fullname} has left this conversation';
        }
        break;
      case MessageV2Type.groupUserRemoved:
        if (payload.senderUser?.id == currentUser) {
          message = '';
        } else {
          message = '${payload.senderUser?.fullname} have removed';
        }
        break;
      case MessageV2Type.groupUserAdded:
        if (payload.senderUser?.id == currentUser) {
          message =
              'you have added ${chat?.payload.groupUsers.firstWhereOrNull((user) => user.id == payload.addedUser)?.fullname}';
        } else {
          message =
              '${payload.senderUser?.fullname} have added ${chat?.payload.groupUsers.firstWhereOrNull((user) => user.id == payload.addedUser)?.fullname} ';
        }
        break;
      case MessageV2Type.groupNameChanged:
        if (payload.senderUser?.id == currentUser) {
          message = 'you have changed group name';
        } else {
          message = '${payload.senderUser?.fullname} have changed group name';
        }
        break;
      case MessageV2Type.groupSettingUpdated:
        message = '';
        break;
      case MessageV2Type.groupCreated:
        if (payload.senderUser?.id == currentUser) {
          message = 'you created a new group';
        } else {
          message = '${payload.senderUser?.fullname} has created new group';
        }
        break;
      case MessageV2Type.notificationChanged:
        break;
      case MessageV2Type.link:
        break;
    }
    return message;
  }

  static String downloadLink(String file) {
    return BackendApis.baseUrlV2 +
        (BackendApis.downloadfile.replaceAll('{file}', file));
  }

  static Map<int, List<MessageV2Model>> groupMessagesByChatId(
      List<ChatModel> chats) {
    final groupedMessages = <int, List<MessageV2Model>>{};

    for (final chat in chats) {
      final chatId = chat.id;
      if (!groupedMessages.containsKey(chatId)) {
        groupedMessages[chatId] = [chat.message];
      } else {
        groupedMessages[chatId]!.add(chat.message);
      }
    }

    return groupedMessages;
  }
}
