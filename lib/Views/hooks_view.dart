import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../views/menu_drawer.dart';

class HooksView extends HookWidget {
  const HooksView({super.key});
  @override
  Widget build(BuildContext context) {
    final count = useState(0);

    useEffect(() {
      debugPrint('画面が表示された');

      return () {
        debugPrint('画面消えた（Drawerでは、呼ばれない）');
      };
    }, const []);

    // 値が変化したらどちらも呼ばれるため、return後は不要？
    useEffect(() {
      debugPrint('countが変化した（retrun前）');
      return () {
        debugPrint('countが変化した（retrun後）');
      };
    }, [count.value]);

    final text = Text('現在のカウントは${count.value}');

    final button = ElevatedButton(
      onPressed: () {
        count.value++;
      },
      child: const Text('ボタン'),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text('Hooksお試し画面'),
        ),
        drawer: const MenuDrawer(),
        body: Column(
          children: [text, button],
        ));
  }
}
