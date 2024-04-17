import 'package:flutter/material.dart';

class CreateDialog {
  static Future<void> show(BuildContext context) async {
    showDialog(
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
        Navigator.of(context).pop();
        return;
      }
    } catch (e) {
      ///
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      titlePadding: EdgeInsets.zero,
      title: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Text(
            'Enter Details',
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14),
          ),
          const Spacer(),
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.clear)),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: Theme.of(context).textTheme.labelSmall),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: _descriptionController,
            maxLines: 3,
            maxLength: null,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: Theme.of(context).textTheme.labelSmall),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            _createData();
          },
          child: const Text('Create'),
        ),
      ],
    );
  }
}
