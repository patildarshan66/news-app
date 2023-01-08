import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDateToString(DateTime? dateTime){
  if(dateTime==null){
    return '';
  }
  return DateFormat('yyyy-mm-dd hh:mm a').format(dateTime);
}

BuildContext? _dialogContext;

closeLoader() {
  if (_dialogContext != null) {
    Navigator.pop(_dialogContext!);
    _dialogContext = null;
  }
}

Future<void> startLoader(BuildContext context) async {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (buildContext) {
      _dialogContext = buildContext;
      return const SizedBox(
          height: 50,
          width: 50,
          child: Center(child: CircularProgressIndicator()));
    },
  );
}

void customPrinter(String msg) {
  if (kDebugMode) {
    log(msg);
  }
}

Future<bool> isConnected() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}