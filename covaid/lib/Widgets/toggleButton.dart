import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:covaid/Utils/glintUI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToggleButton extends StatelessWidget {
  String label;
  bool isSelected = false;

  ToggleButton({
    @required this.label,
    @required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 13.0,
      ),
      margin: EdgeInsets.only(
        right: 20.0,
      ),
      child: Center(
        child: Row(
          children: [
            Text(
              '$label',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: GlintUI.wheezGrey[3],
                fontSize: Get.width * 0.013,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Icon(
              Icons.add,
              color: GlintUI.wheezGrey[3],
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: isSelected ? GlintUI.covaidPink : GlintUI.covaidGrey[0],
        boxShadow: [
          BoxShadow(
            color: GlintUI.covaidPurple.withOpacity(0.1),
            blurRadius: 6.0,
            offset: Offset(0.0, 6.0),
          )
        ],
      ),
    );
  }
}
