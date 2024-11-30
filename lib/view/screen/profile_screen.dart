import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/controller/user_controller.dart';
import 'package:newhotelyemeni/view/widget/fontandtext.dart';
import 'package:newhotelyemeni/view/screen/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final userController = Get.find<UserController>();

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.blue, size: 30),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption(
      String title, String value, IconData icon, VoidCallback onTap) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.blue),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.right,
      ),
      subtitle: Text(
        value,
        style: TextStyle(color: Colors.grey),
        textAlign: TextAlign.right,
      ),
      trailing: Icon(Icons.arrow_back_ios, size: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = Get.find<CustomTextStyles>();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'الملف الشخصي',
          style: textStyles.titleStyle(),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () => Get.to(() => EditProfileScreen()),
          ),
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          userController.userData.value['profileImage'] ?? ''),
                    ),
                    SizedBox(height: 16),
                    Text(
                      userController.userData.value['name'] ?? '',
                      style: textStyles.titleStyle(fontSize: 24),
                    ),
                    SizedBox(height: 8),
                    Text(
                      userController.userData.value['email'] ?? '',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: _buildStatCard(
                            'الحجوزات',
                            userController.userData.value['totalBookings']
                                .toString(),
                            Icons.hotel,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: _buildStatCard(
                            'المفضلة',
                            userController.userData.value['favoriteHotels']
                                .toString(),
                            Icons.favorite,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'معلومات الحساب',
                        style: textStyles.titleStyle(fontSize: 18),
                      ),
                    ),
                    _buildProfileOption(
                      'رقم الهاتف',
                      userController.userData.value['phone'] ?? '',
                      Icons.phone,
                      () {},
                    ),
                    Divider(height: 1),
                    _buildProfileOption(
                      'الموقع',
                      userController.userData.value['location'] ?? '',
                      Icons.location_on,
                      () {},
                    ),
                    Divider(height: 1),
                    _buildProfileOption(
                      'عضو منذ',
                      userController.userData.value['memberSince'] ?? '',
                      Icons.calendar_today,
                      () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                color: Colors.white,
                child: Column(
                  children: [
                    _buildProfileOption(
                      'الإعدادات',
                      'تخصيص التطبيق',
                      Icons.settings,
                      () {},
                    ),
                    Divider(height: 1),
                    _buildProfileOption(
                      'المساعدة والدعم',
                      'الأسئلة الشائعة والمساعدة',
                      Icons.help,
                      () {},
                    ),
                    Divider(height: 1),
                    ListTile(
                      onTap: () {
                        // تسجيل الخروج
                      },
                      leading: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.logout, color: Colors.red),
                      ),
                      title: Text(
                        'تسجيل الخروج',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      trailing: Icon(Icons.arrow_back_ios, size: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
