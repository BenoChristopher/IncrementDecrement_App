import'package:flutter/material.dart';

void displayAlertMessageToUser( String message ,BuildContext context){

  showDialog(context: context, builder: (context){

    return AlertDialog(title: Text(message),);
  });
}
