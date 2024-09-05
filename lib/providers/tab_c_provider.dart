import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../data/repositories/repositories.dart';
import '../models/models.dart';
import '../utils/utils.dart';
import 'providers.dart';

class TabCProvider extends ChangeNotifier {
  final LocalRepository localRepository = LocalRepository();
  final AppRepository appRepository = AppRepository();
  String title = 'sdfsdfsafdsdf';
  String? selectedItem;
  String description = 'asdfasdfsdfsfd';
  bool isLeftSwithcEnable = false;
  int participants = 0;
  Map<int, FileModel> files = {};
  String message = '';

  ManageUI usersManageUi = ManageUI.loading;

  ManageUI ottManageUi = ManageUI.loading;

  ManageUI modeManageUi = ManageUI.loading;
  GroupModel? group;
  List<UserModel> users = [];

  //// current user as default
  String? currentUser;

  List<OttModel> otts = [];

  OttModel? selectedOtt;

  Map<String, List<ModeModel>> modes = {};

  TabCProvider({
    required ChatMessagesProvider chatMessagesProvider,
  }) {
    fetchGroup(chatMessagesProvider: chatMessagesProvider);
  }

  List<Map<String, dynamic>> menus = [
    {
      'id': '0',
      'label': 'Item 1',
    },
    {
      'id': '1',
      'label': 'Item 2',
    },
    {
      'id': '2',
      'label': 'Item 3',
    },
    {
      'id': '3',
      'label': 'Item 4',
    },
    {
      'id': '4',
      'label': 'Settings',
    },
  ];

  switchChanged() {
    isLeftSwithcEnable = !isLeftSwithcEnable;
    notifyListeners();
  }

  menuItemSelected(String v) {
    selectedItem = v;
    notifyListeners();
  }

  setTitleAndDescription(String titleValue, String decriptionValue) {
    title = titleValue;
    description = decriptionValue;
    notifyListeners();
  }

  changedMessage(String v) {
    message = v;
    notifyListeners();
  }

  getMediaFiles() async {
    try {
      final mediaFiles = await localRepository.galleryPhotos();
      for (var i = 0; i < mediaFiles.length; i++) {
        final file = mediaFiles[i];
        files[file.file.hashCode] = mediaFiles[i];
      }
      logger.i(files.length);
      notifyListeners();
    } catch (e) {
      logger.e(e);
    }
  }

  thumbnailGenerated(int key, String thumbnail) {
    files[key]!.thumbnail = thumbnail;
    notifyListeners();
  }

  removeFile(int key) {
    files.remove(key);
    notifyListeners();
  }

  getAttachmentType(String name) {
    if (Tools.isVideo(name)) {
      return AttachementType.video;
    } else {
      return AttachementType.image;
    }
  }

  updateFiles(List<PlatformFile> files) {
    try {
      for (var i = 0; i < files.length; i++) {
        final file = files[i];
        this.files[file.xFile.path.hashCode] = FileModel(
          name: file.name,
          file: file.xFile.path,
          size: file.size,
          filetype: AttachementType.file,
        );
      }
      notifyListeners();
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> fetchGroup({
    required ChatMessagesProvider chatMessagesProvider,
  }) async {
    try {
      final g = await appRepository.fetchGroup();
      group = g;
      loadUsers();
      chatMessagesProvider.chatCreated(documentId: group!.gid);
    } catch (e) {
      logger.e(e);
    }
  }

  loadUsers() async {
    try {
      notifyListeners();
      final users =
          await appRepository.getUsers(ids: group?.participants ?? []);
      logger.i(users.length);
      this.users = users;
      usersManageUi = ManageUI.loaded;
      currentUser = users.first.uid;
      notifyListeners();
    } catch (e) {
      logger.e(e);
      usersManageUi = ManageUI.failure;
      notifyListeners();
    }
  }

  loadOtt() async {
    try {
      ottManageUi = ManageUI.loading;
      notifyListeners();
      final otts = await appRepository.getOtt();
      this.otts = otts;
      ottManageUi = ManageUI.loaded;
      notifyListeners();
    } catch (e) {
      logger.e(e);
      ottManageUi = ManageUI.failure;
      notifyListeners();
    }
  }

  loadModes(String ottId) async {
    try {
      modeManageUi = ManageUI.loading;
      notifyListeners();
      final modes = await appRepository.getModes(ottId: ottId);
      this.modes[ottId] = modes;
      modeManageUi = ManageUI.loaded;
      notifyListeners();
    } catch (e) {
      logger.e(e);
      modeManageUi = ManageUI.failure;
      notifyListeners();
    }
  }

  selectOtt(OttModel ott) {
    if (ott.sid == selectedOtt?.sid) {
      selectedOtt = null;
    } else {
      selectedOtt = ott;
    }

    notifyListeners();
    if (modes[ott.sid] == null) {
      loadModes(ott.sid);
    }
  }

  selectCurrentUser(String uid) {
    currentUser = uid;
    notifyListeners();
  }
}
