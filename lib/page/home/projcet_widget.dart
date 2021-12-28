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
        SlidableAction(
          onPressed: (_) {
            showCardBottomSheet(widgets: [
              itemListTile(
                  title: project.name,
                  onTap: () {},
                  leading: Icons.insert_drive_file_outlined,
                  haveNext: true,
                  subTitle: modifyTime,
                  trailingDesc: 'rename'.tr),
              itemListTile(
                  title: '置顶',
                  onTap: () {},
                  leading: Icons.sticky_note_2_outlined,
                  subTitle: 'p5js'),
              itemListTile(
                  title: '分享',
                  onTap: () {
                    Share.share(project.code);
                  },
                  leading: Icons.share_outlined,
                  subTitle: 'p5js'),
              itemListTile(
                  title: '打印',
                  onTap: () {},
                  leading: Icons.print_outlined,
                  subTitle: 'p5js'),
            ]);
          },
          backgroundColor: Get.theme.primaryColor,
          foregroundColor: Colors.white,
          icon: Icons.more_horiz,
          label: 'more'.tr,
        ),
        SlidableAction(
          onPressed: (_) {
            slideTapFunction.call();
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete_outline,
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
