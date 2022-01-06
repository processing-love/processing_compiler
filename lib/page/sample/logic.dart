import 'package:get/get.dart';
import 'package:processing_compiler/data/api_example_nodes_fetch.dart';

import 'state.dart';

class SampleLogic extends GetxController {
  final SampleState state = SampleState();

  @override
  void onInit() async {
    super.onInit();
    final apiNodes = await ApiExampleNodesFetch.getApiExampleNodes();
    state.exampleNodes.addAll(apiNodes);
  }
}
