import 'package:get/get.dart';
import '../ui/pages/home_page.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
  ];
}