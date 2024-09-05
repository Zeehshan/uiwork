import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import '../../utils/utils.dart';
import '../widgets/widgets.dart';

class UserSheet {
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
              padding: const EdgeInsets.all(30),
              width: double.infinity,
              child: const UsersSheet());
        });
  }
}

class UsersSheet extends StatelessWidget {
  const UsersSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final tabCState = context.watch<TabCProvider>();
    if (tabCState.usersManageUi == ManageUI.loading) {
      return const LoadingWidget();
    }
    if (tabCState.usersManageUi == ManageUI.failure) {
      ///TODO:
      return const Text('Something went wrong, please try again');
    }
    if (tabCState.users.isEmpty) {
      ///TODO:
      return const Text('There is no corresponding user');
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Select A as (Current) and B as (Other) users to start chat',
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14),
          ),
        ),
        ...tabCState.users.map((user) => ListTile(
              onTap: () =>
                  context.read<TabCProvider>().selectCurrentUser(user.uid),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              minLeadingWidth: 0,
              leading: const Icon(Icons.person),
              title: Text(user.displayname),
              trailing: tabCState.currentUser == user.uid
                  ? const Icon(Icons.check)
                  : null,
            )),
      ],
    );
  }
}
