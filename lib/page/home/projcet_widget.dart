import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:processing_compiler/db/db_project_file.dart';
import 'package:processing_compiler/devices/messages.dart';
import 'package:processing_compiler/page/base/base_page.dart';
import 'package:processing_compiler/page/editor/view.dart';
import 'package:processing_compiler/page/home/logic.dart';
import 'package:processing_compiler/widgets/item_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timeago/timeago.dart';

/// @author u
/// @date 2020/6/12.

class ProjectWidget extends StatelessWidget {
  final logic = Get.put(HomeLogic());

  ProjectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      isContentList: true,
      isHaveAppBar: false,
      contentListWidgets: [
        cardItemListViewWidget(
            itemCount: logic.state.projectFiles.length,
            itemBuilder: (BuildContext context, int index) {
              final project = logic.buildSortResultProjectFiles()[index];
              return itemWidgetForSlide((projectFile) {
                Get.to(EditorPage(
                  projectFile: projectFile,
                ));
              }, () {
                logic.deleteProject(index);
              }, project);
            }),
      ],
    );
  }
}

Widget itemWidgetForSlide(
    Function onPressed, Function slideTapFunction, DbProjectFile project) {
  DateMessage().buildCurrentDateMessage();
  final modifyTime =
      format(DateTime.fromMillisecondsSinceEpoch(project.modifyTime));
  return Slidable(
    endActionPane: ActionPane(
      motion: const ScrollMotion(),
      children: [
        // SlidableAction(
        //   onPressed: (_) {
        //     showEditProjectDialog(project);
        //   },
        //   backgroundColor: Colors.blueGrey,
        //   foregroundColor: Colors.white,
        //   icon: Icons.insert_drive_file_outlined,
        //   label: 'rename'.tr,
        // ),
        SlidableAction(
          onPressed: (_) {
            Share.share(project.code);
          },
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          icon: Icons.share_rounded,
          label: 'share'.tr,
        ),
        SlidableAction(
          onPressed: (_) {
            slideTapFunction.call();
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete_outline_rounded,
          label: 'delete'.tr,
        ),
      ],
    ),
    child: itemListTile(
        title: project.name,
        onTap: () {
          onPressed.call(project);
        },
        haveNext: true,
        leading: Icons.folder_outlined,
        subTitle: modifyTime),
  );
}
