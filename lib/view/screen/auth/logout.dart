import 'package:flutter/material.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(onPressed: (){
              Text('LogOUt');
            }, child: Text('LogOUt')
            )

          ],
        ),
      ),

      ),
    );

  }
}

//
// Future<void> _unsubscribeFromTopic(String uid) async {
//   await FirebaseMessaging.instance.unsubscribeFromTopic(uid);
//   print('Unsubscribed from FCM topic: $uid');
// }
