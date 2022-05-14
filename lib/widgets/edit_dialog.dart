import 'package:flutter/material.dart';

showEditDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Padding(
                padding:  EdgeInsets.all(8.0),
                child: TextField(

                  decoration: InputDecoration(
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                  //  border: InputBorder(borderSide: BorderSide.none).copyWith()
                  ),
                ),
              ),
              Container(
                height: 20,
                width: 20,
                color: Colors.red,
              )
            ],
          ),
        );
      });
}
