import 'package:flutter/material.dart';
import './quote.dart';
import './quote_card.dart';

void main() {
  runApp(
    const MaterialApp(home: QuoteList()),
  );
}

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  static String author = 'Michael Li';

  List<Quote> quotes = [
    Quote(text: "Be yourself, everyone else is already taken", author: author),
    Quote(text: "I have nothing to declare except my genius", author: author),
    Quote(text: "The truth is rarely pure and never simple", author: author),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Awesome Quotes"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes
            .map(
              (quote) => QuoteCard(
                quote: quote,
                delete: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
