import 'package:flutter/material.dart';

import '../screens/stream/widgets/widgets.dart';

class CreateDialog {
  static Future<dynamic> show(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) => const CreateWidget(),
    );
  }
}

class CreateWidget extends StatefulWidget {
  const CreateWidget({super.key});

  @override
  State<CreateWidget> createState() => _CreateWidgetState();
}

class _CreateWidgetState extends State<CreateWidget> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  _createData() async {
    try {
      final title = _titleController.text;
      final description = _descriptionController.text;
      if (title.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Title is needed'),
          ),
        );
        return;
      }
      if (title.isNotEmpty || description.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Details Added Successfully'),
          ),
        );
        Navigator.pop(
            context, [_titleController.text, _descriptionController.text]);
      }
    } catch (e) {
      ///
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10),
      // ),
      // titlePadding: EdgeInsets.zero,
      appBar: AppBar(
        title: Text(
          'Enter Details',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Title',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              padding: const EdgeInsets.only(left: 12),
              child: TextField(
                controller: _titleController,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 18),
                decoration: InputDecoration(
                  hintText: '',
                  border: InputBorder.none,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                  contentPadding: const EdgeInsets.only(bottom: 0.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Decription',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              padding: const EdgeInsets.only(left: 12),
              child: TextField(
                controller: _descriptionController,
                maxLength: 80,
                maxLines: null,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 18),
                decoration: InputDecoration(
                  hintText: '',
                  counterText: '',
                  border: InputBorder.none,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                  contentPadding: const EdgeInsets.only(bottom: 0.0),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 20),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                color: Theme.of(context).dividerColor.withOpacity(.4),
                width: 2),
          ),
        ),
        child: SafeArea(
          child: ElevatedButtonWidget(
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(
                'Create',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
              onPressed: () => _createData()),
        ),
      ),
    );
  }
}
