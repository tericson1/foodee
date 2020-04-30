import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/services.dart';

//void main() => runApp(new MediaQuery(
//  data: new MediaQueryData(), child: new MaterialApp(home: new SecondTab())));

//final databaseReference = Firestore.instance;

//Firestore.instance.collection('Dishes').document().setData({ 'name': 'Name', 'category': 'Category', 'restaurant':'Restaurant' });

class SecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Text('Add a Review');
    //return Scaffold(
    //resizeToAvoidBottomPadding: false,
    //backgroundColor: Colors.grey[50],
    // body: //Text('Add A Review'),
    final _formKey = GlobalKey<FormState>();

    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          Text("Add a Review",
              style: TextStyle(
                  color: Colors.lightGreenAccent[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 26)),
          TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.restaurant),
              labelText: 'Restaurant',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.restaurant_menu),
              labelText: 'Dish',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.stars),
              labelText: 'Rating',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            //maxLength: 500,
            maxLines: 10,
            decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.fastfood),
                labelText: 'Review',
                hintText: 'Enter your review of the meal here'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          // new FormField(
          //   builder: (FormFieldState state) {
          //     return InputDecorator(
          //       decoration: InputDecoration(
          //         icon: const Icon(Icons.color_lens),
          //         labelText: 'Color',
          //       ),
          //       isEmpty: _color == '',
          //       child: new DropdownButtonHideUnderline(
          //         child: new DropdownButton(
          //           value: _color,
          //           isDense: true,
          //           onChanged: (String newValue) {
          //             setState(() {
          //               newContact.favoriteColor = newValue;
          //               _color = newValue;
          //               state.didChange(newValue);
          //             });
          //           },
          //           items: _colors.map((String value) {
          //             return new DropdownMenuItem(
          //               value: value,
          //               child: new Text(value),
          //             );
          //           }).toList(),
          //         ),
          //       ),
          //     );
          //   },
          // ),

          // Add TextFormFields and RaisedButton here.
        ]));
  }
}

// Define a custom Form widget.
