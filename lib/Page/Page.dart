export 'ChatPage.dart';
export 'EditPage.dart';

import 'package:flutter/material.dart';


class PageScaffold extends StatelessWidget {
  const PageScaffold({Key? key,
      required this.title,
      this.actions = const [],
      this.body,
      this.floatingActionButton}) : super(key: key);

  final String title;
  final List<Widget> actions;
  final Widget? body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    // 1. look for an ancestor Scaffold
    final ancestorScaffold = Scaffold.maybeOf(context);
    // 2. check if it has a drawer
    //                    Has it Scaffold?     && has Scaffold the drawer?
    final hasDrawer = ancestorScaffold != null && ancestorScaffold.hasDrawer;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        leading: hasDrawer
            ? IconButton(
            icon: const Icon(Icons.menu),
            onPressed: hasDrawer ? () => ancestorScaffold.openDrawer(): null)
            : null,
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
