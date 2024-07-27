import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marckit/core/config/helpers.dart';

class ItemsModel {
  String id;
  String title;
  String description;
  String quintity;
  String image;
  String userId;
  String orderData;
  String orderTime;
  String type;

  ItemsModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.quintity,
      required this.image,
      required this.userId,
      required this.orderTime,
      required this.orderData,
      required this.type});

  factory ItemsModel.fromQuery(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return ItemsModel(
      id: testDocuments(doc, 'id', ''),
      title: testDocuments(doc, 'title', ''),
      description: testDocuments(doc, 'description', ''),
      quintity: testDocuments(doc, 'quintity', ''),
      image: testDocuments(doc, 'image', ''),
      userId: testDocuments(doc, 'user_id', ''),
      orderTime: testDocuments(doc, 'order_time', ''),
      orderData: testDocuments(doc, 'order_data', ''),
      type: testDocuments(doc, 'type', ''),

      //  type: doc['type'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'quintity': quintity,
      'image': image,
      'user_id': userId,
      'order_time': orderTime,
      'order_data': orderData,
      'type': type
    };
  }
}
