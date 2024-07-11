import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Colors.blue,size: 30,),
        hintText: 'What do you search for?',
        hintStyle: TextStyle(
          fontSize: 17,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1,
            )
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1,
          ),
        ),

        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color:Colors.blue,
            width: 1,
          ),
        ),
        constraints: BoxConstraints(
            maxWidth: 25,
            maxHeight: 60
        ),
      ),
    );
  }
}

