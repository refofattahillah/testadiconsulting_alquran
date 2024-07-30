import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:testadiconsulting_alquran/app/ui/models/surah_model.dart';

class HomeController extends GetxController {
  var counter = 0.obs;
  var surahList = <Surah>[].obs;
  var isLoading = true.obs;

  void increment() {
    counter++;
  }

  @override
  void onInit() {
    fetchSurahs();
    super.onInit();
  }


  void fetchSurahs() async {
    try {
      isLoading(true);
      var response = await Dio().get('https://equran.id/api/v2/surat');
      if (response.statusCode == 200) {
        var data = response.data['data'] as List;
        surahList.value = data.map((json) => Surah.fromJson(json)).toList();
      }
    } catch (e) {
      print("Error fetching surahs: $e");
    } finally {
      isLoading(false);
    }
  }
}