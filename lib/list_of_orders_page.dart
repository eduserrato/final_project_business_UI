import 'package:final_project_business_ui/products_page.dart';
import 'package:flutter/material.dart';
import 'package:final_project_business_ui/model/order_item.dart';
import 'package:final_project_business_ui/main.dart';
import 'model/drink_item.dart';

//This will brake if you delete products because it wont find the information of the order.

class OrdersScreen extends StatefulWidget {
  List<OrderItem>orderItemsList;
  OrdersScreen(this.orderItemsList);
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Container(
        child: 
        ListView(children: <Widget>[
          SizedBox(height: 5,),
          for(var orderItem in widget.orderItemsList)
          Builder(builder: (context){
            return OrderContainer(orderItem: orderItem); // .........................here add the orderItem
          },)
        ],)
      ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Color(0xFFBA55D3),
          height:55,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Icon(Icons.local_bar),
                  Text("Products"),
                ]),
                onPressed: ()async{ 
        List<FoodItem>foodItemsList = await foodItems();
         Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProductsScreen(foodItemsList)));
              print('Products Button Pressed');       ////HERE IS THE NAVEGATION TO OTHER PAGES
        },
                ),
            
             MaterialButton(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Icon(Icons.toc),
                  Text("Orders"),
                ]),
                onPressed: (){debugPrint('pressed');}
                ),

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
      preparing: orderItem.preparing,
      ready: orderItem.ready,
      delivered: orderItem.delivered,
      quantity: orderItem.quantity,
    );
  }
}

class Oitems extends StatelessWidget {

  Oitems({
  @required this.drink_name,
  @required this.drink_id,
  @required this.order_id,
    this.preparing,
    this.ready,
    this.delivered,
    this.quantity,
  });

  String drink_name;
  String drink_id;
  String order_id;
  bool preparing;
  bool ready;
  bool delivered;
  int quantity;

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        
            Card(

              margin: const EdgeInsets.all(10),
             // decoration: myBoxDecoration() ,
              child:Column(
                children: <Widget>[
                Text("$drink_name", style: TextStyle(
                  fontSize: 20,
                fontWeight: FontWeight.bold,
                
              ),),
              
                Text("    Order id: $order_id", style: TextStyle(
                  fontSize: 15
                ),),
                 Text("    Quantity: $quantity", style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),),
                Padding(padding: EdgeInsets.fromLTRB(10, 5,10, 20)),
                Row( mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                RaisedButton(
                  onPressed:(){
                    preparing = !preparing;
                    print(preparing);
                  
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