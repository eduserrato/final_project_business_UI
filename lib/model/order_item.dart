import 'package:flutter/foundation.dart';

OrderItemList orderItemList = OrderItemList(orderItems: [

  OrderItem(
    drink_name: "Sex on the Beach shot",
    drink_id: 0,
    order_id: 0,
  ),
  OrderItem(
    drink_name: "Vodka shot",
    drink_id: 3,
    order_id: 1,
  ),
  OrderItem(
    drink_name: "Tequila shot",
    drink_id: 4,
    order_id: 3,
  ),
  OrderItem(
    drink_name: "Tequila shot",
    drink_id: 4,
    order_id: 4,
  ),
  OrderItem(
    drink_name: "Sex on the Beach shot",
    drink_id: 0,
    order_id: 5,
  ),
  OrderItem(
    drink_name: "La bandera shot",
    drink_id: 6,
    order_id: 6,
  ),
  OrderItem(
    drink_name: "Jager Bomb",
    drink_id: 5,
    order_id: 7,
  ),
]);

class OrderItemList{
  List<OrderItem> orderItems;
  OrderItemList({@required this.orderItems});
}

class OrderItem{
  String drink_name;
  int drink_id;
  int order_id;
  bool prepared;
  bool delivered;

  OrderItem({
    @required this.drink_name,
    @required this.drink_id,
    @required this.order_id,
    this.prepared = false,
    this.delivered = false,
  });


}