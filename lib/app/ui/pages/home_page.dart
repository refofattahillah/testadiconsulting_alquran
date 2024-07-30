import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surah List'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.separated(
          itemCount: controller.surahList.length,
          itemBuilder: (context, index) {
            final surah = controller.surahList[index];
            return ListTile(
              title: Row(
                children: [
                  Text(surah.namaLatin), Text('/${surah.nama}'),
                ],
              ),
              subtitle: Text(surah.arti),
              onTap: () {
                // Handle tap event, for example, navigate to a detail page
                 AudioPlayer().stop();
                 Source src= UrlSource(surah.audioFull.audio01);
                 AudioPlayer().play(src);
              },
              trailing: Icon(Icons.play_arrow, color: Colors.green,),
            );
          }, 
          separatorBuilder: (context, index) {
          return Divider(
            height: 1,
            color: Colors.grey,
          );
        },
        );
      }),
    );
  }
}