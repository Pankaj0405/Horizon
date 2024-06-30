import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  String id;
  String eventName;
  String organizationName;
  String address;
  String description;
  String maxSlots;
  String price;
  String imagePath;
  String type;
  String To;
  String From;
  String StartTime;
  String EndTime;
  String vendorId;
  String userId;
  String userPhone;

  Booking(
      {required this.address,
        required this.description,
        required this.eventName,
        required this.organizationName,
        required this.id,
        required this.price,
        required this.maxSlots,
        required this.imagePath,
        required this.To,
        required this.From,
        required this.StartTime,
        required this.EndTime,
        required this.vendorId,
        required this.userId,
        required this.userPhone,
        required this.type});

  Map<String, dynamic> toJson() => {
    "id": id,
    "Event Name": eventName,
    "Organization Name": organizationName,
    "Address": address,
    "Description": description,
    "Max Slots": maxSlots,
    "Booking price": price,
    "Image Path": imagePath,
    "Type": type,
    "To":To,
    "From":From,
    "Start Time":StartTime,
    "End Time":EndTime,
    "vendorId":vendorId,
    'userId':userId,
    "userPhone":userPhone
  };

  static Booking fromSnap(Map<String, dynamic> snapshot) {

    return Booking(
        id: snapshot["id"],
        address: snapshot["Address"],
        description: snapshot["Description"],
        eventName: snapshot["Event Name"],
        organizationName: snapshot["Organization Name"],
        maxSlots: snapshot["Max Slots"],
        price: snapshot["Booking price"],
        imagePath: snapshot["Image Path"],
        type: snapshot["Type"],
        To:snapshot['To'],
        From: snapshot['From'],
        StartTime:snapshot["Start Time"],
        EndTime: snapshot['End Time'],
        vendorId: snapshot['vendorId'],
      userId: snapshot['userId'],
      userPhone: snapshot['userPhone']
    );
  }
}
