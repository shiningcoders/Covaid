import 'package:get/get.dart';

class QueryController extends GetxController {
  var selected = 0.obs;
  var filters =
      ['Oxygen Cylinder', 'Normal Bed', 'ICU Bed', 'Plasma Donator'].obs;

  String get queryString => filters[selected.value];

  setSelected(int value) {
    selected.value = value;
  }
}
