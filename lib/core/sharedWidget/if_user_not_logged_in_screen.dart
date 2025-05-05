import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';
import 'package:newhotelyemeni/core/consttint/rout_name.dart';

class IfUserNotLoggedInScreen extends StatelessWidget {
  const IfUserNotLoggedInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            children: [
              const Spacer(),
              Icon(
                Icons.calendar_today_outlined,
                size: 150,
                color: AppColors.primaryColor,
              ),
              const SizedBox(height: 50),
              const Text(
                'لا تستطيع رؤية الحجز الخاص بك؟',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'سجل دخولك للاطلاع على حجوزاتك',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 237, 111, 111),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 48, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Get.toNamed(RoutName.login);
                },
                child: const Text(
                  'تسجيل الدخول',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Get.toNamed(RoutName.signup);
                },
                child: const Text(
                  'ليس لديك حساب معنا؟ إنشاء حساب جديد',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'قم بتسجيل دخولك او انشء حساب معنا لحفظ وعرض حجوزاتك',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 20),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
