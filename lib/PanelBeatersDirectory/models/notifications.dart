import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsModel {
  final String? notificationsId;
  final String notificationTypeId;
  final String notificationTitle;
  final Map? data;
  final Timestamp? notificationDate;
  final String notification;
  final String? personInterested;
  final String? make;
  final int listingsId;
  final int? publish;
  final int? send;
  final int? showAddressBlock;
  final bool? read;

  NotificationsModel(
      {this.notificationsId,
      required this.notificationTypeId,
      required this.notificationTitle,
      this.data,
      this.notificationDate,
      required this.notification,
      this.personInterested,
      this.make,
      required this.listingsId,
      this.publish,
      this.send,
      this.showAddressBlock,
      this.read});
}
