import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:horizon/models/booking.dart';
import 'package:uuid/uuid.dart';
import '../constants.dart';
import '../models/event.dart' as event_model;
import '../models/volunteer.dart' as volunteer_model;

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final Rx<List<event_model.AddEvent>> _eventData =
  Rx<List<event_model.AddEvent>>([]);
  List<event_model.AddEvent> get eventData => _eventData.value;
  final Rx<List<volunteer_model.AddVolunteers>> _volunteerData =
  Rx<List<volunteer_model.AddVolunteers>>([]);
  List<volunteer_model.AddVolunteers> get volunteerData => _volunteerData.value;
  final Rx<List<event_model.AddEvent>> _tourData =
  Rx<List<event_model.AddEvent>>([]);
  List<event_model.AddEvent> get tourData => _tourData.value;

  // Future<List<add_event_model.AddEvent>> getAllEvents() async {
  //   QuerySnapshot querySnapshot = await firestore.collection('events').get();
  //
  //   List<add_event_model.AddEvent> events = querySnapshot.docs
  //       .map((documentSnapshot) => add_event_model.AddEvent.fromSnap(documentSnapshot))
  //       .toList();
  //   print('Fetched events: $events');
  //   return events;
  // }
  //
  // Future<List<add_event_model.AddEvent>> getAllTours() async {
  //   QuerySnapshot querySnapshot = await firestore.collection('tours').get();
  //
  //   List<add_event_model.AddEvent> tours = querySnapshot.docs
  //       .map((documentSnapshot) => add_event_model.AddEvent.fromSnap(documentSnapshot))
  //       .toList();
  //   print('Fetched events: $tours');
  //   return tours;
  // }

  Future<void>  getEvent() async {
    try {
      final QuerySnapshot querySnapshot =
      await firestore.collection('events').get();
      List<event_model.AddEvent> events = querySnapshot.docs
          .map((doc) =>
          event_model.AddEvent.fromSnap(doc.data() as Map<String, dynamic>))
          .toList();
      eventData.assignAll(events);

    } catch (e) {
      // Handle any errors, e.g., connection issues or Firestore rules.
      print('Error fetching data: $e');
    }

  }

  Future<void> getTour() async {
    try {
      final QuerySnapshot querySnapshot =
      await firestore.collection('tours').get();
      List<event_model.AddEvent> events = querySnapshot.docs
          .map((doc) =>
          event_model.AddEvent.fromSnap(doc.data() as Map<String, dynamic>))
          .toList();
      tourData.assignAll(events);

    } catch (e) {
      // Handle any errors, e.g., connection issues or Firestore rules.
      print('Error fetching data: $e');
    }

    // print(tourData[1].description);
  }

  Future<void> getVolunteers() async {
    try {
      final QuerySnapshot querySnapshot =
      await firestore.collection('volunteers').get();
      List<volunteer_model.AddVolunteers> events = querySnapshot.docs
          .map((doc) =>
          volunteer_model.AddVolunteers.fromSnap(doc.data() as Map<String, dynamic>))
          .toList();
      volunteerData.assignAll(events);
      print(querySnapshot.docs);
    } catch (e) {
      // Handle any errors, e.g., connection issues or Firestore rules.
      print('Error fetching data: $e');
    }
    // _volunteerData.bindStream(firestore
    //     .collection('volunteers')
    //     .snapshots()
    //     .map((QuerySnapshot query) {
    //   List<volunteer_model.AddVolunteers> retValue = [];
    //   for (var element in query.docs) {
    //     retValue.add(volunteer_model.AddVolunteers.fromSnap(element));
    //   }
    //   return retValue;
    // }));
  }

  void tourBookings(String id) async {
    try {
      String bookingId = const Uuid().v1();
      await firestore.collection('tours').doc(id).collection('bookings').doc(bookingId).set(
          {
            "id": bookingId,
          }).then((value) => Get.snackbar(
          'Alert', ' Booked successfully'));
    } catch (e) {
      Get.snackbar('Error while booking', e.toString());
    }

  }
  Future<void> addBooking(
      String eventName,
      String orgName,
      String address,
      String desc,
      String maxSlots,
      String price,
      String imagePath,
      String type,
      String fromDate,
      String toDate,
      String startTime,
      String endTime,
      String id,
      String vendorId) async {
    try {
      String eventId = const Uuid().v1();
      // String id = const Uuid().v1();
      if (eventName.isNotEmpty &&
          orgName.isNotEmpty &&
          address.isNotEmpty &&
          desc.isNotEmpty &&
          maxSlots.isNotEmpty &&
          price.isNotEmpty &&
          imagePath.isNotEmpty &&
          type != 'Select' &&
          fromDate.isNotEmpty &&
          toDate.isNotEmpty &&
          startTime.isNotEmpty &&
          endTime.isNotEmpty &&
          vendorId.isNotEmpty) {
        Booking newEvent = Booking(
            address: address,
            description: desc,
            eventName: eventName,
            organizationName: orgName,
            id: eventId,
            maxSlots: maxSlots,
            price: price,
            imagePath: imagePath,
            type: type,
            From: fromDate,
            To: toDate,
            StartTime: startTime,
            EndTime: endTime,
            vendorId: vendorId,
        userId: firebaseAuth.currentUser!.uid,
        userPhone: firebaseAuth.currentUser!.phoneNumber!);
        if (type == "Event") {
          await firestore
              .collection('events')
              .doc(id).collection('bookings').doc(eventId)
              .set(newEvent.toJson())
              .then((value) =>
              Get.snackbar('Alert', 'Event created successfully'));
        } else {
          await firestore
              .collection('tours')
              .doc(id).collection('bookings').doc(eventId)
              .set(newEvent.toJson())
              .then((value) =>
              Get.snackbar('Alert', 'Tour created successfully'));
        }
      } else {
        Get.back();
        Get.snackbar('Alert', 'Please enter all fields');
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error creating event or tour', e.toString());
      print(e.toString());
    }
  }


  void eventBookings(String id) async {
    try {
      String bookingId = const Uuid().v1();
      await firestore.collection('events').doc(id).collection('bookings').doc(bookingId).set(
          {
            "id": bookingId,
          }).then((value) => Get.snackbar(
          'Alert', ' Booked successfully'));
    } catch (e) {
      Get.snackbar('Error while booking', e.toString());
    }

  }
}