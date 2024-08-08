import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../providers/providers.dart';
import '../../../utils/utils.dart';
import 'widgets/widgets.dart';

class UploadFilesScreen extends StatelessWidget {
  final UploadType uploadType;
  final List<XFile?>? files;
  const UploadFilesScreen({super.key, required this.uploadType, this.files});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          UploadFilesProvider(type: uploadType, context: context),
      child: Scaffold(
        appBar: AppBar(),
        body: const BodyWidget(),
        bottomNavigationBar: SafeArea(child: Builder(builder: (context) {
          return const UploadButtonWidget();
        })),
      ),
    );
  }
}
