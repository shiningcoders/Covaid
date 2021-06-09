import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TrackerDataController extends GetxController {
  var cases = '---'.obs;
  var recovery = '---'.obs;
  var deaths = '---'.obs;

  String k_m_b_generator(num) {
    if (num > 999 && num < 99999) {
      return "${(num / 1000).toStringAsFixed(1)} K";
    } else if (num > 99999 && num < 999999) {
      return "${(num / 1000).toStringAsFixed(0)} K";
    } else if (num > 999999 && num < 999999999) {
      return "${(num / 1000000).toStringAsFixed(1)} M";
    } else if (num > 999999999) {
      return "${(num / 1000000000).toStringAsFixed(1)} B";
    } else {
      return num.toString();
    }
  }

  fetchData() async {
    final response = await http.get(
      Uri.parse('https://corona.lmao.ninja/v2/countries/india'),
    );
    if (response.statusCode == 200) {
      var rawData = json.decode(response.body);
      cases.value = k_m_b_generator(rawData["cases"]).toString();
      recovery.value = k_m_b_generator(rawData["recovered"]).toString();
      deaths.value = k_m_b_generator(rawData["deaths"]).toString();
    } else {
      Get.snackbar(
        'Failed to fetch data',
        'Unable to fetch the data for tracker. Contact to developer or open an issue on github.',
        duration: Duration(seconds: 3),
      );
    }
  }

  fetchUpdatedData() async {
    final response = await http.get(
      Uri.parse('https://corona.lmao.ninja/v2/countries/india'),
    );
    if (response.statusCode == 200) {
      var rawData = json.decode(response.body);
      cases.value = k_m_b_generator(rawData["cases"]).toString();
      recovery.value = k_m_b_generator(rawData["recovered"]).toString();
      deaths.value = k_m_b_generator(rawData["deaths"]).toString();
    } else {
      Get.snackbar(
        'Failed to fetch data',
        'Unable to fetch the data for tracker. Contact to developer or open an issue on github.',
        duration: Duration(seconds: 3),
      );
    }
  }

  @override
  void onInit() async {
    await fetchData();
    super.onInit();
  }
}
