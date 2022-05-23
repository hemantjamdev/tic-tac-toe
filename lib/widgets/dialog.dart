import 'package:flutter/material.dart';

Future<bool> buildShowDialog(BuildContext context, String info)  async{
  return await showDialog(
    barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
                onPressed: () {

                  Navigator.pop(context,true);
                },
                child: const Text('OK'))
          ],
          content: Text(info),
        );
      });
}
