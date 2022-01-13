import 'package:get/get.dart';
import 'package:processing_compiler/data/api_example_nodes_fetch.dart';

import 'state.dart';

class ExampleLogic extends GetxController {
  final ExampleState state = ExampleState();

  @override
  void onInit() async {
    super.onInit();
    state.imagesMap = await ApiExampleNodesFetch.getApiExampleNodes();
    final apiNodes = await ApiExampleNodesFetch.getApiExampleDetailNodes();
    state.exampleNodes.addAll(apiNodes);
  }
}
