import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

// OrderItemList orderItemList = OrderItemList(orderItems: [

//   OrderItem(
//     drink_name: "Sex on the Beach shot",
//     drink_id: 0,
//     order_id: 0,
//   ),
//   OrderItem(
//     drink_name: "Vodka shot",
//     drink_id: 3,
//     order_id: 1,
//   ),
//   OrderItem(
//     drink_name: "Tequila shot",
//     drink_id: 4,
//     order_id: 3,
//   ),
//   OrderItem(
//     drink_name: "Tequila shot",
//     drink_id: 4,
//     order_id: 4,
//   ),
//   OrderItem(
//     drink_name: "Sex on the Beach shot",
//     drink_id: 0,
//     order_id: 5,
//   ),
//   OrderItem(
//     drink_name: "La bandera shot",
//     drink_id: 6,
//     order_id: 6,
//   ),
//   OrderItem(
//     drink_name: "Jager Bomb",
//     drink_id: 5,
//     order_id: 7,
//   ),
// ]);

// class OrderItemList{
//   List<OrderItem> orderItems;
//   OrderItemList({@required this.orderItems});
// }

class OrderItem{
  String drink_name;
  String drink_id;
  String order_id;
  int quantity;
  bool preparing;
  bool ready;
  bool delivered;

  OrderItem({
    this.drink_name,
    this.drink_id,
    this.order_id,
    this.quantity,
    this.preparing = false,
    this.ready = false,
    this.delivered = false,
  });

  factory OrderItem.fromJson(Map<dynamic, dynamic> json){
    return OrderItem(
      drink_id: json['_id'], 
      drink_name: json['name'], 
      order_id: json['orderId'], 
      quantity: json['quantity'], 
      preparing: json['preparing'], 
      ready: json['ready'],
      delivered: json['delivered']);
  }
}

Future<List<OrderItem>>orderItems()async{
  List<OrderItem>orderItemsList = [];
  Map data1;
  List ordersData;

  http.Response response = await http.get('http://10.0.2.2:3000/orders');
  if (response.statusCode == 200){
    debugPrint(response.body);
    String serverText = response.body;
    data1 = json.decode(response.body);
    //List<dynamic> data = json.decode(serverText);
    ordersData = data1['orders'];
    for(int i = 0; i < ordersData.length; i++){
      orderItemsList.add(OrderItem.fromJson(ordersData[i]));
    }
    return orderItemsList;
  }
  else{
    print("Couldn't acces database");
    return null;
  }
}