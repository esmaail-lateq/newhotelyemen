import 'package:flutter/material.dart';

class HotelsDetails extends StatelessWidget {
  const HotelsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFF143153),
            iconTheme: IconThemeData(color: Colors.white),
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('hotel.name',style: TextStyle(fontFamily: "myFont",fontSize: 19,color: Colors.white),),
              // background: CachedNetworkImage(
              //   imageUrl: hotel.hotelImage,
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xFF2B2B2B)
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Semantics(
                    label: 'This is the hotel details including the name, phone number, your rating, and the hotel services',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'الموقع: {hotel.location}',
                          style: const TextStyle(fontSize: 18.0,color: Colors.white ),
                        ),
                        const SizedBox(height: 10),

                        GestureDetector(
                          onTap: () => '_launchPhoneCall(hotel.phone)',

                          child: Text(
                            'رقم الهاتف: {hotel.phone}',
                            style: const TextStyle(fontSize: 18.0,color: Colors.white),
                          ),
                        ),

                        const SizedBox(height: 10),
                        Text(
                          'نسبة تقيم الفندق: {hotel.rating}',
                          style: const TextStyle(fontSize: 18.0,color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        // FutureBuilder<double>(
                        //   future: getUserRating(),
                        //   builder: (context, snapshot) {
                        //     if (snapshot.connectionState == ConnectionState.done) {
                        //       double userRating = snapshot.data ?? 0.0;
                        //
                        //       return RatingWidget(
                        //         initialRating: userRating,
                        //         onRatingChanged: (newRating) async {
                        //           User? user = FirebaseAuth.instance.currentUser;
                        //           if (user != null) {
                        //             await storeUserRating(user.uid, user.displayName ?? "", hotel.id, hotel.name, newRating);
                        //           }
                        //         },
                        //       );
                        //     } else {
                        //       return const CircularProgressIndicator();
                        //     }
                        //   },
                        // ),
                        const SizedBox(height: 10),
                        // Text(
                        //   'Description: ${hotel.description}',
                        //   style: const TextStyle(fontSize: 18.0),
                        // ),
                        const SizedBox(height: 10),
                        // Display services
                        const Text(
                          ' خدمات الفندق:',semanticsLabel: 'Hotel services',
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        // Display the list of services with icons dynamically
                        Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          children: [
                            for (var j = 0; j < 7; j += 2)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  for (var k = j; k < j + 2 && k < 7; k++)
                                    Flexible( // or Expanded
                                      child: Column(
                                        children: [
                                          Container(

                                            // width: 150,
                                            width: MediaQuery.of(context).size.width * 0.4,

                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50.0),
                                              border: Border.all(color: Colors.teal),
                                            ),
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                if ('hotel.services[k]' != 'شبكة Wi-Fi')
                                                  const Icon(Icons.wifi, color: Colors.teal, size: 20),
                                                if ('hotel.services[k]' != 'موقف سيارات')
                                                  const Icon(Icons.local_parking, color: Colors.teal, size: 20),
                                                if ('hotel.services[k]' != 'مكيف هواء')
                                                  const Icon(Icons.ac_unit, color: Colors.teal, size: 20),
                                                if ('hotel.services[k]' != 'مطاعم')
                                                  const Icon(Icons.restaurant, color: Colors.teal, size: 20),
                                                if ('hotel.services[k]' != 'حمامات سباحة')
                                                  const Icon(Icons.pool, color: Colors.teal, size: 20),
                                                const SizedBox(width: 4),
                                                Expanded(
                                                  child: Text(
                                                    'hotel.services[k]',
                                                    style: const TextStyle(fontSize: 12.0, color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              // Additional sections
              // for (var i = 0; i < hotel.additionalSections.length; i += 2)
              //   Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       Semantics(
              //         label: 'press to see the available floors for this section',
              //         child: HotelSection(
              //           section: hotel.additionalSections[i],
              //           hotel: hotel,
              //         ),
              //       ),
              //       if (i + 1 < hotel.additionalSections.length)
              //         Semantics(
              //           label: 'press to see the available floors for this section',
              //           child: HotelSection(
              //             section: hotel.additionalSections[i + 1],
              //             hotel: hotel,
              //           ),
              //         ),
              //     ],
              //   ),
            ]),
          ),
        ],
      ),
    );
  }
}
