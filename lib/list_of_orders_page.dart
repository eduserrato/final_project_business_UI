import 'package:flutter/material.dart';
import 'package:final_project_business_ui/model/order_item.dart';
import 'package:final_project_business_ui/main.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Container(
        child: ListView(children: <Widget>[
          SizedBox(height: 5,),
          for(var orderItem in orderItemList.orderItems)
          Builder(builder: (context){
            return OrderContainer(orderItem: orderItem); // .........................here add the orderItem
          },)
        ],)
      )
      ),
      
    );
  }
}

class OrderContainer extends StatelessWidget {

  OrderContainer({
    @required this.orderItem,
  });

  final orderItem;

  @override
  Widget build(BuildContext context) {
    return Oitems(
      drink_id: orderItem.drink_id,
      drink_name: orderItem.drink_name,
      order_id: orderItem.order_id,
      prepared: orderItem.prepared,
      delivered: orderItem.delivered,
    );
  }
}

class Oitems extends StatelessWidget {

  Oitems({
  @required this.drink_name,
    @required this.drink_id,
    @required this.order_id,
    this.prepared,
    this.delivered,
  });

  String drink_name;
  int drink_id;
  int order_id;
  bool prepared;
  bool delivered;

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        
            Container(

              margin: const EdgeInsets.all(10),
              decoration: myBoxDecoration() ,
              child:Column(
                children: <Widget>[
                Text("$drink_name", style: TextStyle(
                  fontSize: 20,
                fontWeight: FontWeight.bold,
                
              ),),
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text("    Order id: $order_id", style: TextStyle(
                  fontSize: 15
                ),),
                Padding(padding: EdgeInsets.fromLTRB(10, 5,10, 20)),
                RaisedButton(
                  onPressed:(){
                    prepared = !prepared;
                    print(prepared);
                  
                  },
                  child: Text("Prepared!"),
                ),
                Padding(padding: EdgeInsets.fromLTRB(10, 5, 10, 25)),
                RaisedButton(
                  onPressed:(){
                    delivered = !delivered;
                    print(delivered);
                  
                  },
                  child: Text("Delivered!"),
                ),
              ],)
                ],
            ),
          
        


        )

      ],
    );
  }
}

BoxDecoration myBoxDecoration(){
  return BoxDecoration(
    
    borderRadius: BorderRadius.all(
      Radius.circular(5)
    ),
    border: Border.all()
  );
}