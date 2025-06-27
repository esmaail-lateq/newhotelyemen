import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newhotelyemeni/features/home/data/hotel_modle.dart';

class HotelCardView extends StatelessWidget {
  final HotelsModle hotel;

  const HotelCardView({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 0.68,
      child: Container(
        // width: 200,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: hotel.images!.isEmpty
                ? NetworkImage(
                    'https://yemenihotel.com/hotels_images/no-image.png')
                : NetworkImage(hotel.images!.first.imageUrl!),
            // image: AssetImage(hotel.images![0].imageUrl!),
            // image: NetworkImage("${AppLinks.rootImage}/hotel/$image"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 50,
              // ),
              Text(
                hotel.name!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5), // مسافة صغيرة بين العناصر
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    hotel.city!,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '. ${hotel.address!}',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              SizedBox(height: 5), // مسافة صغيرة بين العناصر
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 18),
                      Icon(Icons.star, color: Colors.yellow, size: 18),
                      Icon(Icons.star, color: Colors.yellow, size: 18),
                      Icon(Icons.star, color: Colors.yellow, size: 18),
                      Icon(Icons.star_border, color: Colors.yellow, size: 18),
                      SizedBox(width: 5),
                      Text(
                        hotel.rating!.toString(),
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(11)),
                    child: Text(
                      'التفاصيل',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
