import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providers.dart';
import '../../../widgets/widgets.dart';

class UploadButtonWidget extends StatelessWidget {
  const UploadButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final providerState = context.watch<UploadFilesProvider>();
    return ElevatedButtonWidget(
      height: 52,
      width: double.infinity,
      margin: const EdgeInsets.all(40),
      backgroundColor: Theme.of(context).primaryColor,
      showProgressIndicator: providerState.uploadStarted,
      onPressed: providerState.files.isEmpty
          ? null
          : () => providerState.uploadFileCalled(),
      child: Text(
        'Upload',
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Colors.white),
      ),
    );
  }
}
