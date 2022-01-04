import 'package:flutter/material.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:styled_widget/styled_widget.dart';

class ExamplePage extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: '明教'),
    const Tab(text: '霸刀'),
    const Tab(text: '天策'),
    const Tab(text: '纯阳'),
    const Tab(text: '少林'),
    const Tab(text: '藏剑'),
    const Tab(text: '七秀'),
    const Tab(text: '五毒'),
  ];

  ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: '示例',
      body: DefaultTabController(
        length: myTabs.length,
        child: Row(
          children: [
            TabBar(
              tabs: myTabs,
              isScrollable: true,
            ),
            TabBarView(
                    children: myTabs
                        .map((Tab tab) => Center(child: Text(tab.text ?? '')))
                        .toList())
                .flexible(flex: 7)
          ],
        ),
      ),
    );
  }
}
