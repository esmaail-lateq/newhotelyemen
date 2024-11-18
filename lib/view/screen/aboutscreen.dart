import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5, // Adjust the elevation as needed
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'أهلًا بكم في  Limits Group!',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Limits Group',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'في Limits Group، نحن لا نقوم بمجرد تحدي الحدود؛ بل نعيد تعريفها. كقوة رائدة في عالم الابتكار والتطور الرقمي  الامحدود. نحن لسنا مجرد شركة برمجية، بل نمثل محوراً حيوياً للابتكار والتحول الرقمي. في قلب كل خطوة نقوم بها، نتجاوز الحدود ونفتح آفاقًا جديدة لتحقيق الأهداف وتحسين العمليات.',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'رؤيتنا',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        ' أن نكون الرواد في عالم التقنية، حيث تلتقي الأفكار المتميزة بالتنفيذ المتميز. نسعى جاهدين لتحقيق التميز في كل تفاصيل منتجاتنا وخدماتنا، ونسعى لتحفيز التحول الذي يلبي تطلعات عملائنا ويفوق توقعاتهم.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'ما يميزنا',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        ' نحن ملتزمون بتقديم حلول فريدة ومبتكرة تحمل بصمة الإبداع وتفتح أفقًا جديدًا في عالم التكنولوجيا.\n\n  نضع في اعتبارنا جودة المنتجات والخدمات كمعيار رئيسي، حيث نسعى دائمًا لتحقيق أعلى مستويات الأداء.\n\n نؤمن بأن الشراكة الفعّالة مع عملائنا تشكل أساس النجاح المستدام، ونسعى دائمًا لبناء علاقات قائمة على الثقة والتفاهم.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'خدماتنا',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'تتنوع خدماتنا بين تطوير البرمجيات المخصصة، وحلول تحليل البيانات، وتصميم واجهات المستخدم الرائعة، مما يمنح عملائنا التحكم الكامل والرؤية الواضحة في مسار نجاحهم.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'انضم إلينا في رحلة التميز والتحول الرقمي. نحن هنا لنحقق معك النجاح ونشاركك في بناء مستقبل تكنولوجي لامحدود.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        ' Limits Group - تحرير قوة الإمكانيات اللانهائية!',
                        style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.orangeAccent),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'للتواصل:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      ' limitsgroup@gmail.com',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                  ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: GestureDetector(
                        onTap: () => ('+96770107908'),
                        child: Text(
                          '+967 770107908',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,),
                        ),
                      )
                  ),
                  // ListTile(
                  //   leading: Icon(
                  //     Icons.location_on,
                  //     color: Colors.teal,
                  //   ),
                  //   title: Text(
                  //     'العنوان: شارع حدة, صنعاء, اليمن',
                  //     style: TextStyle(color: Colors.teal),
                  //   ),
                  // ),
                  SizedBox(height: 1),
                  Image.asset(
                    'assets/images/logo.png',
                    // Replace with your actual image path
                    height: 200, // Adjust the height as needed
                    width: 200,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
