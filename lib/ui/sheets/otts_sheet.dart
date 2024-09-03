import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import '../../utils/utils.dart';
import '../widgets/widgets.dart';

class OttsSheet {
  static show({
    required BuildContext context,
  }) {
    showModalBottomSheet(
        context: context,
        useSafeArea: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        builder: (context) {
          return Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              child: const OttsSheetWidget());
        });
  }
}

class OttsSheetWidget extends StatelessWidget {
  const OttsSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tabCState = context.watch<TabCProvider>();
    if (tabCState.ottManageUi == ManageUI.loading) {
      return const LoadingWidget();
    }
    if (tabCState.usersManageUi == ManageUI.failure) {
      ///TODO:
      return const Text('Something went wrong, please try again');
    }
    if (tabCState.otts.isEmpty) {
      ///TODO:
      return const Text('There is no corresponding ott');
    }
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: tabCState.otts
            .map((ott) => Column(
                  children: [
                    ListTile(
                      onTap: () => context.read<TabCProvider>().selectOtt(ott),
                      title: Text(ott.sname),
                      trailing: AnimatedRotation(
                        duration: const Duration(milliseconds: 300),
                        turns:
                            tabCState.selectedOtt?.sid == ott.sid ? 0.25 : 1.0,
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                        ),
                      ),
                    ),
                    if (tabCState.selectedOtt?.sid == ott.sid)
                      Builder(builder: (context) {
                        if (tabCState.modeManageUi == ManageUI.loading) {
                          return const LoadingWidget();
                        }
                        if (tabCState.modes[ott.sid] != null) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              children: tabCState.modes[ott.sid]!
                                  .map((mode) => ListTile(
                                        title: Text(mode.modename),
                                      ))
                                  .toList(),
                            ),
                          );
                        }
                        return const Text('Nothing loadded');
                      }),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
