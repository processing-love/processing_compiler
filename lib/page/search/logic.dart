import 'package:get/get.dart';
import 'package:processing_compiler/data/api/model_api_node.dart';
import 'package:processing_compiler/data/api/model_api_node_details.dart';
import 'package:processing_compiler/data/api_nodes_fetch.dart';
import 'package:processing_compiler/page/search/api_detail_page.dart';

import 'state.dart';

class SearchLogic extends GetxController {
  final SearchState state = SearchState();

  void changeIndex(int index) {
    state.currentIndex.value = index;
  }

  @override
  void onInit() async {
    super.onInit();
    final apiNodes = await ApiNodesFetch.getApiNodes();
    Map<String, List<ModeApiNode>> categoryMap = {};
    for (var node in apiNodes) {
      if (!categoryMap.containsKey(node.childJson?.category ?? '')) {
        categoryMap[node.childJson?.category ?? ''] = [];
      }
      categoryMap[node.childJson?.category]?.add(node);
    }
    state.apiNodes.addAll(categoryMap);
  }

  gotoDetail(ModeApiNode apiNode) async {
    ModelApiNodeDetails currentNodeDetails = await ApiNodesFetch.getApiDetailNode(apiNode.name ?? '');
    Get.to(ApiDetailPage(currentNodeDetails, apiNode));
  }
}
