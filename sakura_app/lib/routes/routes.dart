import 'package:get/get.dart';
import 'package:sakura_app/widgets/HalamanKasbon.dart';
import 'package:sakura_app/Components/Halaman_Kasbon.dart';
import 'package:sakura_app/widgets/dashboard.dart';
import '../Components/Tambah_Barang.dart';
import '../widgets/bottomNavbar.dart';
import '../widgets/history.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => const MyBottomNavbar()),
    GetPage(name: home, page: () => const DashboardPage()),
    GetPage(name: add, page: () => const TambahBarang()),
    GetPage(name: history, page: () => const HistoryPage()),
  ];

  static getNavbar() => navbar;
  static getHome() => home;
  static getKasbon() => kasbon;
  static getAdd() => add;
  static getHistory() => history;
  static getProfile() => profile;

  static String navbar = "/";
  static String home = "/home";
  static String kasbon = "/kasbon";
  static String add = "/add";
  static String history = "/history";
  static String profile = "/profile";
}
