import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:newhotelyemeni/core/consttint/text_tthems.dart';
import 'package:newhotelyemeni/features/hotelDetiles/view/widget/small_loaction_map.dart';

class HotleInformation extends StatelessWidget {
  final TabController tabController;
  const HotleInformation({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          tabController.animateTo(1);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: EdgeInsets.only(right: 20),
            alignment: Alignment.center,
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 217, 69, 69),
                borderRadius: BorderRadius.circular(12)),
            child: Text(
              'اختر غرفتك ',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey, width: 0.5)),
                  child: Column(
                    children: [
                      Container(height: 150, child: SmallLoactionMap()),
                      Container(
                          // height: 150,
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.location_on_outlined),
                          Text('اليمن صنعاء شارع الستين')
                        ],
                      )),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'الخدمات',
                    style: TextThemsCustom.font22BlackBolde,
                  )),
              SizedBox(
                height: 5,
              ),
              Container(
                  // width: 200,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey, width: 0.5)),
                  child: GridView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 30, crossAxisCount: 2),
                    children: [
                      buildHotelService(Icons.wifi, 'انترنت'),
                      buildHotelService(Icons.pool_rounded, 'مسبح'),
                      buildHotelService(
                          Icons.local_parking_outlined, 'موقف سيارات'),
                      buildHotelService(Icons.restaurant, 'مصطعم'),
                      buildHotelService(
                          Icons.fastfood_rounded, 'الطعام والشراب'),
                      buildHotelService(Icons.shop_2_outlined, 'اسواق محلية'),
                      buildHotelService(
                          Icons.family_restroom_outlined, 'مناسب للعائلة'),
                      // buildHotelService(Icons.wifi, 'انترنت'),
                    ],
                  )),
              SizedBox(
                height: 15,
              ),
              Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'نبذه عن الفندق',
                    style: TextThemsCustom.font22BlackBolde,
                  )),
              SizedBox(
                height: 5,
              ),
              Container(
                // width: 200,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey, width: 0.5)),
                child: ExpandableText(
                  '''
      دم فندق شانغريلا البوسفور، إسطنبول ملاذا أنيڤا ى الواجهة البحرية في قلب منطقة بشيكتاش. يطل ذا الفندق الفاخر على المناظر الخلابة لمضيق بوسفور، ويقع على مسافة قصيرة سيرا على الاقدام ن قصر دولمة بهجة وقصر تشيران. يتميز الفندق زيج راق من الفخامة الوروبية والضيافة الاسيوية عكس ذلك في تصاميمه الداخلية النبقة وخدماته ستثنائية.
       ـضمن بعض أماكن الإقامة شرفات خاصة توفر للالات خلابة على مضيق البوسفور، بينما تم تصميم ميع الغرف لضمان الراحة بأثاث فاخر. يمكن للضيوف استمتاع بتجارب طعام متنوعة، تشمل المأكولات صينية الاصيلة والنكهات التركية التقليدية. كما يوفر سبا الموجود في الفندق علاجات متجددة للحيوية، إلى انب مسبح داخلي ومركز لياقة بدنية مجهز بالكامل
       صم الفندق 186 غرفة فاخرة، بالإضافة إلى مساحات رنة لاستضافة الفعاليات، سواء كانت اجتماعات عمل مناسبات خاصة. سواء كان الهدف استكشاف المعالم قريبة أو الاسترخاء في أجواء فاخرة، يضمن فندق
      
      ''',
                  expandText: 'عرض المزيد',
                  collapseText: 'اخفاء',
                  maxLines: 4,
                  linkColor: Colors.blue,
                  animation: true,
                  collapseOnTextTap: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey, width: 0.5)),
                child: Column(
                  children: [
                    buildExpandedText('معلومات مهمة',
                        'lug,lhj odkfgldfglkg dfkldfkg lkgldk lkdflkdsljd fg'),
                    buildExpandedText('معلومات مهمة',
                        'lug,lhj odkfgldfglkg dfkldfkg lkgldk lkdflkdsljd fg'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHotelService(IconData icon, String servic) {
    return Row(
      children: [
        Icon(
          icon,
          size: 23,
          color: Colors.grey,
        ),
        SizedBox(
          width: 5,
        ),
        Text(servic)
      ],
    );
  }
}

Widget buildExpandedText(String title, String body) {
  return ExpansionTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      children: [
        ListTile(
          // selectedTileColor: Colorapp.avatarBackground,
          // focusColor: Colorapp.avatarBackground,
          // tileColor: AppColors.background,
          // hoverColor: Colorapp.avatarBackground,
          // splashColor: Colorapp.avatarBackground,
          // selectedColor: Colorapp.avatarBackground,
          minVerticalPadding: 5,
          minTileHeight: 20,
          title: Text(
            // maxLines: ,
            // softWrap: true,lskdjksdjfklj
            // overflow: TextOverflow.ellipsis,
            body,
            style: const TextStyle(fontSize: 13),
          ),
          // trailing: Icon(Icons.edit),
          onTap: () {},
        )
      ]);
}
