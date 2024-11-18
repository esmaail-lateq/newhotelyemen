import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'aboutscreen.dart';
import 'auth/login.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // const HomeScreen({super.key});
  // final HomeScreen counterController = Get.put(HomeScreen());

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('change here!!'),
          backgroundColor: Colors.white, // Deep blue color
          elevation: 0, // No shadow
          // leading: IconButton(
          //   onPressed: () {
          //     Drawer
          //     // Text('press here!!');
          //   },
          //   icon: const Icon(Icons.menu, color: Colors.white), // Used menu icon
          //   tooltip: 'Open navigation menu',
          // ),
          //
          // // actions: _currentIndex == 0
          // //     ? [_buildSearchIcon()] // Conditionally show search icon
          // //     : null,
        ),
      
      
        drawer:
        Drawer(
          child:
          ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF143153),
                ),
                child: Text(
                  'الفندق اليمني ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.hotel_class,
                  color: Colors.teal,
                  semanticLabel: 'Hotel management',
                ),
                title: Text('إدارة الفنادق'),
                onTap: () {
                  Scaffold.of(context).openDrawer();
                  Get.to(()=>Login());
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.developer_board_rounded,
                  color: Colors.teal,
                  semanticLabel: 'This applicatoin work was done by limits Group company ',
                ),
                title: const Text('برمجة وتطوير'),
                onTap: () {
                  Get.to(()=>AboutScreen());
                }
      ),

      ],
      ),
      ),
      ),
    );}
  }