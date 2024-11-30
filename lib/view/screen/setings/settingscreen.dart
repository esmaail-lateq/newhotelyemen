import 'package:flutter/material.dart';

class settingscreen extends StatelessWidget {
  const settingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدم MediaQuery لتحديد حجم الشاشة
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // شريط علوي متجاوب
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: size.height * 0.25,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.all(16),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: size.width * 0.08, // التكيف مع عرض الشاشة
                    backgroundImage: const AssetImage('assets/images/hotelimg.jpg'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'John Doe', // استبدل هذا بالبيانات الديناميكية
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: size.width * 0.05, // التكيف مع العرض
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Show Profile',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final sections = _buildSections(context);
                return sections[index];
              },
              childCount: _buildSections(context).length,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[50],
    );
  }

  // إنشاء الأقسام كقائمة قابلة للتكرار
  List<Widget> _buildSections(BuildContext context) {
    return [
      _sectionHeader('Account Settings'),
      _profileListTile('Personal Information', Icons.person_outline),
      _profileListTile('Payments and Payouts', Icons.payments_outlined),
      _profileListTile('Notifications', Icons.notifications_outlined),
      _sectionHeader('Hosting'),
      _profileListTile('Learn about hosting', Icons.home_outlined),
      _profileListTile('List your space', Icons.add_business_outlined),
      _profileListTile('Host an experience', Icons.beach_access_outlined),
      _sectionHeader('Referrals & Credits'),
      _profileListTile('Gift Cards', Icons.card_giftcard_outlined,
          subtitle: 'Send or redeem a gift card'),
      _profileListTile('Refer a Host', Icons.attach_money_outlined,
          subtitle: 'Earn \$15 for every new host you refer'),
      _sectionHeader('Tools'),
      _profileListTile('Siri Settings', Icons.keyboard_voice_outlined),
      _sectionHeader('Support'),
      _profileListTile('How FlutterUI works', Icons.card_travel_outlined),
      _profileListTile('Safety Center', Icons.shield,
          subtitle:
          'Get the support, tools, and information you need to be safe'),
      _profileListTile('Contact Neighborhood Support',
          Icons.question_answer_outlined,
          subtitle:
          'Let our team know about concerns related to home-sharing activity in your area.'),
      _profileListTile('Get Help', Icons.help_outline),
      _profileListTile('Give us Feedback', Icons.feedback_outlined),
      _sectionHeader('Legal'),
      _profileListTile('Terms of Service', null),
      const SizedBox(height: 24),
      _profileListTile('Log out', null, labelColor: Colors.teal),
      const SizedBox(height: 24),
      Center(
        child: Text(
          'VERSION 1.0.0',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
      const SizedBox(height: 24),
      Center(
        child: Column(
          children: [
            Text(
              'developer by ',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Image.asset('assets/images/limitslogo.png',height: 40,),
          ],
        ),
      ),
    ];
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _profileListTile(
      String label,
      IconData? iconData, {
        String? subtitle,
        Color labelColor = Colors.black,
      }) {
    return ListTile(
      leading: iconData != null
          ? Icon(iconData, color: Colors.teal)
          : null,
      title: Text(
        label,
        style: TextStyle(
          color: labelColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: subtitle != null ? Text(subtitle) : null,
      onTap: () {
        // اضف التنقل أو الإجراءات هنا
      },
    );
  }
}
