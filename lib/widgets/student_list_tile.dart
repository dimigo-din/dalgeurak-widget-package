import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../themes/text_theme.dart';

class StudentListTile extends StatelessWidget {
  DimigoinUser selectStudent;
  Widget trailingWidget;
  StudentListTile({required this.selectStudent, required this.trailingWidget});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(selectStudent.studentId.toString(), style: studentSearchListTileStudentId),
      subtitle: Text(selectStudent.name!, style: studentSearchListTileStudentName),
      leading: SizedBox(
        width: Get.width * 0.1,
        height: Get.width * 0.1,
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.0115),
            SvgPicture.asset('assets/images/user.svg', package: "dalgeurak_widget_package", width: Get.width * 0.07),
          ],
        ),
      ),
      trailing: trailingWidget,
    );
  }
}