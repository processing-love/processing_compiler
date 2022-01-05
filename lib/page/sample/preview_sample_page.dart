import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/db/db_project_file.dart';
import 'package:processing_compiler/page/sample/state.dart';
import 'package:processing_compiler/widgets/code_mirror_web_view.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// @author u
/// @date 2020/6/12.
class PreviewSamplePage extends StatefulWidget {
  final int? index;

  const PreviewSamplePage(this.index, {Key? key}) : super(key: key);

  @override
  _PreviewSampleWidgetState createState() => _PreviewSampleWidgetState();
}

class _PreviewSampleWidgetState extends State<PreviewSamplePage> {
  int currentIndex = 0;

  WebViewController? controller;

  @override
  void initState() {
    currentIndex = widget.index ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SampleCode sampleCode = SampleCode.getSampleCodes()[currentIndex];
    final code = ProjectTypeHelper.getFullHtml(
        sampleCode.projectType.index, sampleCode.code);
    print('peter name ' + sampleCode.name);
    print('peter index ' + currentIndex.toString());
    return Scaffold(
      body: Column(
        children: [
          CodeMirrorWebView(
            rawCode: code,
            onWebViewFinishCreated: (WebViewController controller) {
              controller = controller;
              print('peter ok');
            },
          ).expanded(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  iconSize: 58,
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.code)),
              IconButton(
                  iconSize: 58,
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.close)),
              Visibility(
                visible: currentIndex > 0,
                child: IconButton(
                    iconSize: 58,
                    onPressed: () {
                      currentIndex--;
                    },
                    icon: const Icon(Icons.chevron_left_outlined)),
              ),
              Visibility(
                visible: currentIndex < SampleCode.getSampleCodes().length,
                child: IconButton(
                    iconSize: 58,
                    onPressed: () {
                      currentIndex++;
                      controller?.loadHtmlString('<button>peter</button>');
                      print('peter c' + controller!.toString());
                    },
                    icon: const Icon(Icons.chevron_right_outlined)),
              ),
            ],
          ).marginAll(80),
        ],
      ),
    );
  }
}
