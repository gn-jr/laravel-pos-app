// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_pos_app/data/models/response/product_response_model.dart';

class OrderItem {
  final Product product;
  int quantity;
  OrderItem({
    required this.product,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  Map<String, dynamic> toMapForLocal(int orderId) {
    return {
      'id_order': orderId,
      'product': product.id,
      'quantity': quantity,
      'price': product.price,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      product: Product.fromMap(map['product']),
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItem.fromJson(String source) => OrderItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
