import 'package:flutter/material.dart';
import 'package:demo/pages/home.dart';
import 'package:demo/pages/loading.dart';
import 'package:demo/pages/choose_location.dart';
import 'package:demo/pages/quote/quote_list.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const Loading(),
        "/home": (context) => const Home(),
        "/location": (context) => const ChooseLocation(),
        "/quotes": (context) => const QuoteList(),
      },
    ),
  );
}
