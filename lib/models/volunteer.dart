import 'package:cloud_firestore/cloud_firestore.dart';

class AddVolunteers {
  String id;
  String eventName;
  String volNumber;
  String role;
  String type;
  String imagePath;
  String To;
  String From;
  String StartTime;
  String address;
  String EndTime;
  String vendorId;
  AddVolunteers(
      {required this.id,required this.address,

        required this.role,
        required this.eventName,
        required this.volNumber,
        required this.imagePath,
        required this.To,
        required this.From,
        required this.StartTime,
        required this.EndTime,
        required this.vendorId,
        required this.type});

  Map<String, dynamic> toJson() => {
    "id": id,
    "role": role,
    "Event Name": eventName,
    "No of Volunteers": volNumber,
    "type": type,
    "Address": address,
    "Image Path": imagePath,
    "To Date":To,
    "From Date":From,
    "Start Time":StartTime,
    "End Time":EndTime,
    "VendorId":vendorId
  };

  static AddVolunteers fromSnap(Map<String, dynamic> snapshot) {

    return AddVolunteers(
        id: snapshot["id"],
        role: snapshot["role"],
        eventName: snapshot["Event Name"],
        volNumber: snapshot["No of Volunteers"],
        imagePath: snapshot["Image Path"],
        address: snapshot["Address"],
        type: snapshot['type'],
        To:snapshot['To Date'],
        From: snapshot['From Date'],
        StartTime:snapshot["Start Time"],
        EndTime: snapshot['End Time'],
        vendorId: snapshot['VendorId']);
  }
}
