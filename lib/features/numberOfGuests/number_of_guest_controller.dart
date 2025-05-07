import 'package:get/get.dart';

class NumberOfGuestController extends GetxController {
  var rooms = <Room>[Room()].obs;
  var confermdRooms = <Room>[Room()].obs;

  int get totalAdults =>
      confermdRooms.fold(0, (sum, room) => sum + room.adults.value);

  int get totalChildren =>
      confermdRooms.fold(0, (sum, room) => sum + room.children.value);

  int get totalGuests => totalAdults + totalChildren;

  void addRoom() {
    rooms.add(Room());
  }

  void confirmRoom() {
    confermdRooms = rooms;
    print(totalChildren);
  }

  void removeRoom(int index) {
    if (rooms.length > 1) {
      rooms.removeAt(index);
    }
  }

  void incrementAdults(int roomIndex) {
    if (rooms[roomIndex].total < 8) {
      rooms[roomIndex].adults++;
    }
  }

  void decrementAdults(int roomIndex) {
    if (rooms[roomIndex].adults.value > 0) {
      rooms[roomIndex].adults--;
    }
  }

  void incrementChildren(int roomIndex) {
    if (rooms[roomIndex].total < 8) {
      rooms[roomIndex].children++;
    }
  }

  void decrementChildren(int roomIndex) {
    if (rooms[roomIndex].children.value > 0) {
      rooms[roomIndex].children--;
    }
  }
}

// import 'package:get/get.dart';

class Room {
  RxInt adults;
  RxInt children;

  Room({int adults = 2, int children = 0})
      : adults = adults.obs,
        children = children.obs;

  int get total => adults.value + children.value;
}

// class GuestController extends GetxController {
 
// }