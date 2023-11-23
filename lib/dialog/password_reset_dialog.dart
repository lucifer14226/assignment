import 'package:flutter/cupertino.dart';
import 'package:newsapp/dialog/showdialog.dart';

Future<void> showPaasswordResetSendDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Password Reset',
    content: 'We have sent you password reset email ',
    optionBuilder: () => {
      'Ok': null,
    },
  );
}
