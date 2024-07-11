import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTextField extends StatefulWidget {

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Icon(FontAwesomeIcons.search, color: Color(0xFF466f95),size: 30,),
        ),
        hintText: 'What do you search for?',
        hintStyle: TextStyle(
          fontSize: 17,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Color(0xFFb4c9d6),
              width: 2,
            )
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Color(0xFF466f95),
            width: 1,
          ),
        ),

        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color:Color(0xFF466f95),
            width: 1,
          ),
        ),
        constraints: BoxConstraints(
            maxWidth: 25,
            maxHeight: 65
        ),
      ),
    );
  }
}

