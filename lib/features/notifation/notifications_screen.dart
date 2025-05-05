import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newhotelyemeni/core/widget/fontandtext.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  // نموذج بيانات للإشعارات (سيتم استبداله بالبيانات الفعلية من قاعدة البيانات)
  final List<Map<String, dynamic>> notifications = [
    {
      "title": "تأكيد الحجز",
      "message": "تم تأكيد حجزك في فندق القصر للفترة من 15 إلى 20 يناير",
      "time": "منذ 2 ساعة",
      "isRead": false,
      "type": "booking",
    },
    {
      "title": "عرض خاص",
      "message": "احصل على خصم 20% على حجوزات عطلة نهاية الأسبوع",
      "time": "منذ 5 ساعات",
      "isRead": true,
      "type": "offer",
    },
    {
      "title": "تذكير بالموعد",
      "message": "موعد تسجيل الدخول غداً الساعة 2 مساءً",
      "time": "منذ يوم واحد",
      "isRead": false,
      "type": "reminder",
    },
    {
      "title": "تحديث في الحجز",
      "message": "تم ترقية غرفتك إلى جناح فاخر مجاناً",
      "time": "منذ يومين",
      "isRead": true,
      "type": "update",
    },
  ];

  // دالة لتحديد أيقونة الإشعار حسب نوعه
  IconData _getNotificationIcon(String type) {
    switch (type) {
      case 'booking':
        return Icons.hotel;
      case 'offer':
        return Icons.local_offer;
      case 'reminder':
        return Icons.access_time;
      case 'update':
        return Icons.sync;
      default:
        return Icons.notifications;
    }
  }

  // دالة لتحديد لون الإشعار حسب نوعه
  Color _getNotificationColor(String type) {
    switch (type) {
      case 'booking':
        return Colors.blue;
      case 'offer':
        return Colors.green;
      case 'reminder':
        return Colors.orange;
      case 'update':
        return Colors.purple;
      default:
        return Colors.grey;
    }
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
          'الإشعارات',
          style: textStyles.titleStyle(),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.done_all, color: Colors.grey),
            onPressed: () {
              // تحديد جميع الإشعارات كمقروءة
            },
          ),
        ],
      ),
      body: notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_off,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'لا توجد إشعارات جديدة',
                    style: textStyles.titleStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: notifications.length,
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Card(
                    elevation: notification['isRead'] ? 0 : 2,
                    margin: EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      leading: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: _getNotificationColor(notification['type'])
                              .withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          _getNotificationIcon(notification['type']),
                          color: _getNotificationColor(notification['type']),
                          size: 24,
                        ),
                      ),
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              notification['title'],
                              style: textStyles.titleStyle(
                                fontSize: 16,
                                fontWeight: notification['isRead']
                                    ? FontWeight.normal
                                    : FontWeight.bold,
                              ),
                            ),
                          ),
                          if (!notification['isRead'])
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Text(
                            notification['message'],
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            notification['time'],
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        // معالجة النقر على الإشعار
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
