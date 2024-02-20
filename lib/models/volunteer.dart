import 'package:cloud_firestore/cloud_firestore.dart';

class AddVolunteers {
  String id;
  String eventName;
  String volNumber;
  String role;
  String type;

  AddVolunteers(
      {required this.id,
        required this.role,
        required this.eventName,
        required this.volNumber,
        required this.type});

  Map<String, dynamic> toJson() => {
    "id": id,
    "role": role,
    "Event Name": eventName,
    "No of Volunteers": volNumber,
    "type": type
  };

  static AddVolunteers fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return AddVolunteers(
        id: snapshot["id"],
        role: snapshot["role"],
        eventName: snapshot["Event Name"],
        volNumber: snapshot["No of Volunteers"],
        type: snapshot['type']);
  }
}
