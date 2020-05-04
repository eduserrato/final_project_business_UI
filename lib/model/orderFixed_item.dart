import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
class OrderFixedItem{
  String order_Group;
  String order_id;
  double order_Total_Price;
  String color1;
  String color2;
  bool delivered;
  bool ready;

  OrderFixedItem({
    this.order_Group,
    this.order_id,
    this.order_Total_Price,
    this.color1,
    this.color2,
    this.delivered = false,
    this.ready = false,
  });

  factory OrderFixedItem.fromJson(Map<dynamic, dynamic> json){
    return OrderFixedItem(
      order_id: json['orderId'], 
      order_Group: json['orderGroup'], 
      order_Total_Price: json['orderTotalPrice'], 
      color1: json['color1'],
      color2: json['color2'],
      delivered: json['delivered'], 
      ready: json['ready'],
    );
  }
}
Future<List<OrderFixedItem>>orderFixedItems()async{
  List<OrderFixedItem>orderItemsList = [];
  Map data1;
  List ordersData;

  http.Response response = await http.get('http://10.0.2.2:3000/ordersFixed');
  if (response.statusCode == 200){
    debugPrint(response.body);
    String serverText = response.body;
    data1 = json.decode(response.body);
    //List<dynamic> data = json.decode(serverText);
    ordersData = data1['orders'];
    for(int i = 0; i < ordersData.length; i++){
      orderItemsList.add(OrderFixedItem.fromJson(ordersData[i]));
    }
    return orderItemsList;
  }
  else{
    print("Couldn't acces database");
    return null;
  }
}

Future changeReadyPatch(String _id, bool ready) async {
  // set up PATCH request arguments
  String url = 'http://10.0.2.2:3000/ordersFixed/$_id';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json;
  if (ready == false){
    json = '[	{"propName": "ready", "value": "true"} ]';
  }
  else{
    json = '[ {"propName": "ready", "value": "false"} ]';
  }
  // make PATCH request
  http.Response response = await http.patch(url, headers: headers, body: json);
  // check the status code for the result
  int statusCode = response.statusCode;
  // only the title is updated
  String body = response.body;
}

Future changeDeliveredPatch(String _id, bool delivered) async {
  // set up PATCH request arguments
  String url = 'http://10.0.2.2:3000/ordersFixed/$_id';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json;
  if (delivered == false){
    json = '[{"propName": "delivered", "value": "true"}]';
  }
  else{
    json = '[{"propName": "delivered", "value": "false"}]';
  }
  // make PATCH request
  http.Response response = await http.patch(url, headers: headers, body: json);
  // check the status code for the result
  int statusCode = response.statusCode;
  // only the title is updated
  String body = response.body;
}