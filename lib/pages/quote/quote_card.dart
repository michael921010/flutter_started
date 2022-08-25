import 'package:flutter/material.dart';
import './quote.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({
    this.quote,
    this.delete,
    Key? key,
  }) : super(key: key);

  final Quote? quote;
  final void Function()? delete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote?.text ?? "Quote text",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              quote?.author ?? "Quote author",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton.icon(
              onPressed: delete,
              icon: const Icon(
                Icons.delete_forever,
              ),
              label: const Text("Delete quote"),
            ),
          ],
        ),
      ),
    );
  }
}
