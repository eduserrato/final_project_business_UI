import 'package:final_project_business_ui/model/drink_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './products_page.dart';

class AddProductSceen extends StatefulWidget {
  @override
  _AddProductSceenState createState() => _AddProductSceenState();
}

class _AddProductSceenState extends State<AddProductSceen> {

  Widget _buildDrinkName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Drink Name',
          style: TextStyle(color: Colors.black),
          //style: kLabelStyle,
        ),
       // SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          //decoration: kBoxDecorationStyle,
          color: Colors.white,
          height: 60.0,
          child: TextField(
            controller: name,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black), // color in the box
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.local_bar, color: Colors.black),
              hintText: 'Enter the Name of the Drink',
              //hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildDrinkPrice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Drink Price',
          style: TextStyle(color: Colors.black),
          //style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          //decoration: kBoxDecorationStyle,
          color: Colors.white,
          height: 60.0,
          child: TextField(
            controller: price,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black), // color in the box
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.attach_money, color: Colors.black),
              hintText: 'Enter the Price of the Drink',
              //hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildDrinkImageUrl() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Drink Image Url',
          style: TextStyle(color: Colors.black),
          //style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          //decoration: kBoxDecorationStyle,
          color: Colors.white,
          height: 60.0,
          child: TextField(
            controller: imgUrl,
            keyboardType: TextInputType.url,
            style: TextStyle(color: Colors.black), // color in the box
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.image, color: Colors.black),
              hintText: 'Enter the Image Url of the Drink',
              //hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildDrinkRecipe() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Drink Recipe',
          style: TextStyle(color: Colors.black),
          //style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          //decoration: kBoxDecorationStyle,
          color: Colors.white,
          height: 60.0,
          child: TextField(
            controller: recipe,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black), // color in the box
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.receipt, color: Colors.black),
              hintText: 'Enter the Recipe or Information of Drink',
              //hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildDrinkBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Bar Name',
          style: TextStyle(color: Colors.black),
          //style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          //decoration: kBoxDecorationStyle,
          color: Colors.white,
          height: 60.0,
          child: TextField(
            controller: bar,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black), // color in the box
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.location_on, color: Colors.black),
              hintText: 'Enter the Name of your Bar',
              //hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildCreateButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation:
            5.0, //here is to make it look higher than the others like it was above
        onPressed: () async{ 
          
          await productPost(name.text, imgUrl.text, recipe.text, bar.text, price.text);
        
         List<FoodItem>foodItemsList = await foodItems();
          Navigator.push(context,
             MaterialPageRoute(builder: (context) => ProductsScreen(foodItemsList))
          );
             print('Moving to Products PAGE');
        },
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.white,
        child: Text(
          'CREATE',
          style: TextStyle(
            color: Color(0xFFBA55D3),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

 final name = TextEditingController();
  final recipe = TextEditingController();
  final imgUrl = TextEditingController();
  final bar = TextEditingController();
  final price = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBA55D3),
       title: Text('Add New Product'),
      ),
      body: SafeArea(
        child: Container(
         // height:double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
             padding: EdgeInsets.symmetric(
               horizontal: 10.0,
               vertical: 10.0,
             ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //SizedBox(height: 30.0),
                  _buildDrinkName(),
                 // SizedBox(height: 30.0),
                  _buildDrinkPrice(),
                  _buildDrinkImageUrl(),
                  _buildDrinkRecipe(),
                  _buildDrinkBar(),
                  _buildCreateButton()
                  
                ]),
          ),
        ),
      ),
    );
  }
}