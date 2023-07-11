import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakura_app/Components/Halaman_Kasbon.dart';
import 'package:sakura_app/Components/Profile&Logout.dart';
import 'package:sakura_app/controller/controller.dart';
import 'package:sakura_app/widgets/dashboard.dart';
import '../Components/Tambah_Barang.dart';
import 'history.dart';

class MyBottomNavbar extends StatefulWidget {
  const MyBottomNavbar({super.key});

  @override
  State<MyBottomNavbar> createState() => _MyBottomNavbarState();
}

class _MyBottomNavbarState extends State<MyBottomNavbar> {
  final controller = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(builder: (context) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: const [
            DashboardPage(),
            HalamanKasbon(),
            TambahBarang(),
            HistoryPage(),
            Profiledlogout()
            // profiled()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: controller.tabIndex == 0
                    ? ImageIcon(AssetImage("assets/filled-home.png"))
                    : ImageIcon(AssetImage("assets/unfilled-home.png")),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: controller.tabIndex == 1
                    ? ImageIcon(AssetImage("assets/filled-kasbon.png"))
                    : ImageIcon(AssetImage("assets/unfilled-kasbon.png")),
                label: 'Kasbon',
              ),
              BottomNavigationBarItem(
                  icon: Transform.scale(
                    scale: 2,
                    child: Icon(Icons.add_circle),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                icon: controller.tabIndex == 3
                    ? ImageIcon(
                        AssetImage("assets/filled-history.png"),
                        size: 35,
                      )
                    : ImageIcon(
                        AssetImage("assets/unfilled-history.png"),
                        size: 35,
                      ),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: controller.tabIndex == 4
                    ? ImageIcon(
                        AssetImage("assets/filled-profile.png"),
                        size: 28,
                      )
                    : ImageIcon(
                        AssetImage("assets/unfilled-profile.png"),
                        size: 28,
                      ),
                label: 'Profile',
              ),
            ],
            currentIndex: controller.tabIndex,
            unselectedItemColor: Color.fromRGBO(241, 33, 90, 1),
            selectedItemColor: Color.fromRGBO(241, 33, 90, 1),
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: controller.changeTabIndex),
      );
    });
  }
}
