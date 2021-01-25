import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final String price;
  final String description;
  final String image;
  final DocumentReference reference;

  Product.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['price'] != null),
        assert(map['description'] != null),
        assert(map['image'] != null),
        name = map['name'],
        price = map['price'],
        description = map['description'],
        image = map['image'];

  Product.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$price:$description:$image>";
}