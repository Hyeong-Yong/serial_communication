import 'package:flutter/material.dart';
import 'Page.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Edit',
      body: Center(
        child: Text('Edit Page'),
      ),
    );
  }
}
