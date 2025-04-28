import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/consttint/colors.dart';

class Settingscreen extends StatefulWidget {
  const Settingscreen({super.key});

  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<Settingscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height / 4,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              AppColors.gradint,
              AppColors.primaryColor,
            ]),
            color: Colors.teal,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.orange,
                        child: Icon(Icons.person_2_outlined)

                        //  SvgPicture.asset(
                        //   // fit: BoxFit.cover,
                        //   ImageAsset.avatar,
                        //   // height: 200,
                        //   // width: 200,
                        // )
                        //  Icon(Icons.person, color: Colors.white, size: 30),
                        ),
                    SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "مرحبا بك عبدالملك",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: const Text(
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        "abdalmalik.sawlan@gmail.com",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(" البيانات الشخصية"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text("تغيير كلمة السر"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text("سجل الاشعارات"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text("المفضلة "),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.history_edu_sharp),
                title: const Text("سجل الحجوزات "),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text("اللغة"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text("الوضع المظلم"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              const Divider(),
              const Text("Connect social accounts",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ListTile(
                leading: const Icon(Icons.support_agent_rounded),
                title: const Text("الدعم "),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.contact_phone_outlined),
                title: const Text("التواصل "),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.question_mark_rounded),
                title: const Text("من نحن"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              const SizedBox(height: 50),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    TextButton(
                      onPressed: () async {
                        Get.defaultDialog(
                          backgroundColor: Colors.white,
                          title: 'warning',
                          middleText: 'Are you shour you want to logout?',
                          textConfirm: 'Logout',
                          onConfirm: () {
                            // logout(Get.find());
                          },
                          onCancel: () => Get.back(),
                        );
                      },
                      child: const Text("Log out current account",
                          style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
