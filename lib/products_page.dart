import 'package:final_project_business_ui/add_product_page.dart';

import './model/drink_item.dart';
import 'package:http/http.dart' as http;
import 'list_of_orders_page.dart';
import 'package:flutter/material.dart';
import 'package:final_project_business_ui/model/order_item.dart';
import 'package:final_project_business_ui/main.dart';

//This will brake if you delete products because it wont find the information of the order.

class ProductsScreen extends StatefulWidget {
  List<FoodItem>foodItemsList;
  ProductsScreen(this.foodItemsList);
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBA55D3),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: ()=>{
             Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddProductSceen())
              )
              }
            )
        ],
      ),
      body: SafeArea(child: 
      Container(
        child: 
        ListView(children: <Widget>[
          SizedBox(height: 5,),
          for(var foodItem in widget.foodItemsList)
          Builder(builder: (context){
            return ProductContainer(foodItem: foodItem); 
          },)
        ],)
      )
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
                onPressed:() async{ 
        List<OrderItem>orderItemsList = await orderItems();
         Navigator.push(context,
              MaterialPageRoute(builder: (context) => OrdersScreen(orderItemsList)));
              print('Login Button Pressed');       ////HERE IS THE NAVEGATION TO OTHER PAGES
        },
                ),

          ],)
        )
      ),
    );
  }
}

class ProductContainer extends StatelessWidget {

  ProductContainer({
    @required this.foodItem,
  });

  final foodItem;

  @override
  Widget build(BuildContext context) {
    return Oitems(
      drink_id: foodItem.id,
      drink_name: foodItem.title,
      price: foodItem.price,
      imgUrl: foodItem.imgUrl,
      //.....................................................Here modify this to add items
    );
  }
}

class Oitems extends StatelessWidget {

  Oitems({
  @required this.drink_name,
  @required this.drink_id,
  @required this.price,
  @required this.imgUrl,
  //@required this.order_id,
    this.preparing,
    this.ready,
    this.delivered,
    this.quantity,
    //...................................................Here modify to show things a product has 
  });

  String imgUrl;
  String drink_name;
  String drink_id;
  double price;
//  String order_id;
  bool preparing;
  bool ready;
  bool delivered;
  int quantity;
//................................................................Modify
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        
            Card(

              margin: const EdgeInsets.all(10),
             // decoration: myBoxDecoration() ,
              child:Column(
                children: <Widget>[
                  //SizedBox(height: 10),
                  Container(
                width: double.infinity,
                height: 200,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(5),
                    right: Radius.circular(5),
                  ),
                  child: Image.network(
                    "$imgUrl", // Change this later after modifying the data base.
                     //"https://i2.chefiso.com/srv/images/vegasbomb-splash-coverblock-850x850.jpg",

                    fit: BoxFit.fill,
                  ),
                ),
              ),
                Text("$drink_name", style: TextStyle(
                  fontSize: 20,
                fontWeight: FontWeight.bold,
                
              ),),
              
                Text("    Drink id: $drink_id", style: TextStyle(
                  fontSize: 15
                ),),
                 Text("    Price: \$$price", style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),),
                Padding(padding: EdgeInsets.fromLTRB(10, 5,10, 20)),
                Row( mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                RaisedButton(  //color: Color(0xFFB71C1C),                          //...........This is the butto to delete.
                  onPressed:(){
                    preparing = !preparing;
                    print(preparing);
                  
                  },
                  child: Row(children: <Widget>[
                    Text("Delete"),
                    Icon(Icons.delete),
                  ])
                ),
                Padding(padding:  EdgeInsets.fromLTRB(0, 0, 10, 0))
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