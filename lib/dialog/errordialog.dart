import 'package:flutter/material.dart';
import 'package:newsapp/dialog/showdialog.dart';

Future<void> showErrorDialog(BuildContext context, String text) {
  return showGenericDialog(
    context: context,
    title: 'Error',
    content: text,
    optionBuilder: () => {
      'Ok': null,
    },
  );
}
