import 'package:flutter/material.dart';
import 'Widgets/Widgets.dart';
import 'Page/Page.dart';
import 'package:serial_communication_hy/Widgets/sideMenu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()) );
}

class MyApp extends ConsumerWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPageBuilder = ref.watch(selectedPageBuilderProvider);
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: SplitView(
        menu: SideMenu(),
        page: selectedPageBuilder(context),
        breakpoint: 1000,
        menuWidth: 200,
      ),
    );
  }
}

class SplitView extends StatelessWidget {
  const SplitView({Key? key,
    required this.menu,
    required this.page,
    this.breakpoint = 600,
    this.menuWidth = 240}) : super(key: key);

  final Widget menu;
  final Widget page;
  final double breakpoint;
  final double menuWidth;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= breakpoint) {
      return Row(
        children: [
          SizedBox(width: menuWidth, child: menu,),
          Container(width: 0.5, color: Colors.black,),
          Expanded(child: page,),
        ],
      );
    } else {
      return Scaffold(
        body: ChatPage(),
        drawer: SizedBox(
          width: menuWidth,
          child: Drawer(
            child: menu,
          ),
        ),
      );
    }
  }
}
