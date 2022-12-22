import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serial_communication_hy/Page/Page.dart';

final selectedPageNameProvider = StateProvider<String>((ref) => _availablePages.keys.first);
final selectedPageBuilderProvider = Provider<WidgetBuilder>((ref) {
  final selectedPageKey = ref.watch(selectedPageNameProvider);
  return _availablePages[selectedPageKey]!;
});


final _availablePages = <String, WidgetBuilder>{
  'Chat': (_) => const ChatPage(),
  'Edit': (_) => const EditPage(),
};


class SideMenu extends ConsumerWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPageName = ref.watch(selectedPageNameProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Menu',),
      ),
      body: ListView(
        children: [
          for (var pageName in _availablePages.keys)
            PageListTile(
              pageName: pageName,
              selectedPageName: selectedPageName,
              onPressed: () { _selectPage(context, ref, pageName);},
            )
        ],
      ),
    );
  }
}

void _selectPage(BuildContext context, WidgetRef ref, String pageName) {
  if ( ref.read(selectedPageNameProvider.notifier).state != pageName){
    ref.read(selectedPageNameProvider.notifier).state = pageName;
  }
}

class PageListTile extends StatelessWidget {
  const PageListTile(
      {Key? key, this.selectedPageName, required this.pageName, this.onPressed})
      : super(key: key);

  final String? selectedPageName;
  final String pageName;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Opacity(
        opacity: selectedPageName == pageName ? 1.0 : 0.0,
        child: const Icon(Icons.check),
      ),
      title: Text(pageName),
      onTap: onPressed,
    );
  }
}
