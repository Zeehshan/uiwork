import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providers.dart';
import '../../../../utils/utils.dart';
import '../../../dialogs/dialogs.dart';

class OptionsWidget extends StatefulWidget {
  const OptionsWidget({
    super.key,
  });

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget>
    with TickerProviderStateMixin {
  late ChangeTabProvider changeTabProvider;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late final Animation<double> _scaleAnimation =
      CurvedAnimation(parent: _controller, curve: Curves.linearToEaseOut);

  @override
  void initState() {
    changeTabProvider = context.read<ChangeTabProvider>();
    changeTabProvider.updatesOptionsAnimatedcontroller(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ChangeTabProvider>();
    if (!state.blurrEnable) {
      return Container();
    }
    return Positioned(
      left: 30,
      bottom: 90,
      child: ScaleTransition(
        scale: _scaleAnimation,
        alignment: Alignment.bottomLeft,
        child: SingleChildScrollView(
          child: Column(
            children: ChatAddOptions.values
                .map((option) => Padding(
                      padding: const EdgeInsets.only(bottom: 22),
                      child: InkWell(
                        onTap: () async {
                          context.read<ChangeTabProvider>().blurrChanged(false);
                          switch (option) {
                            case ChatAddOptions.photos:
                              Provider.of<TabCProvider>(context, listen: false)
                                  .getMediaFiles();
                              break;
                            case ChatAddOptions.files:
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                      type: FileType.any, allowMultiple: true);
                              if (result?.files != null) {
                                Provider.of<TabCProvider>(context,
                                        listen: false)
                                    .updateFiles(result!.files);
                              }

                              break;
                            case ChatAddOptions.dialog:
                              await Future.delayed(
                                  const Duration(milliseconds: 350));
                              CreateDialog.show(context).then((value) {
                                if (value != null) {
                                  Provider.of<TabCProvider>(context,
                                          listen: false)
                                      .setTitleAndDescription(
                                          value[0], value[1]);
                                }
                              });
                              break;
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              margin:
                                  const EdgeInsets.only(bottom: 0, right: 10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Icon(
                                option.icon,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              child: Text(
                                option.label,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
