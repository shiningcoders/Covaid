import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:covaid/Controllers/queryController.dart';
import 'package:covaid/Widgets/toggleButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterSelector extends StatelessWidget {
  QueryController _queryController = Get.put(QueryController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Obx(
        () => ListView(
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(
              width: 120.0,
            ),
            for (int i = 0; i < _queryController.filters.length; i++)
              BouncingWidget(
                child: ToggleButton(
                  label: _queryController.filters[i],
                  isSelected: _queryController.selected.value == i,
                ),
                onPressed: () {
                  _queryController.setSelected(i);
                },
              ),
          ],
        ),
      ),
    );
  }
}
