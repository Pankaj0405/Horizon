import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
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

  void getEvent() async {
    _eventData.bindStream(
        firestore.collection('events').snapshots().map((QuerySnapshot query) {
          List<event_model.AddEvent> retValue = [];
          for (var element in query.docs) {
            retValue.add(event_model.AddEvent.fromSnap(element));
          }
          return retValue;
        }));
  }

  void getTour() async {
    _tourData.bindStream(
        firestore.collection('tours').snapshots().map((QuerySnapshot query) {
          List<event_model.AddEvent> retValue = [];
          for (var element in query.docs) {
            retValue.add(event_model.AddEvent.fromSnap(element));
          }
          return retValue;
        }));
  }

  void getVolunteers() async {
    _volunteerData.bindStream(firestore
        .collection('volunteers')
        .snapshots()
        .map((QuerySnapshot query) {
      List<volunteer_model.AddVolunteers> retValue = [];
      for (var element in query.docs) {
        retValue.add(volunteer_model.AddVolunteers.fromSnap(element));
      }
      return retValue;
    }));
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