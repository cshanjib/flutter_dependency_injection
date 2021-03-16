import 'package:dependency_injection_demo/data/models/quote.dart';
import 'package:dependency_injection_demo/data/repositories/quote_repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dependency Injection Demo',
      home: MyQuotePage(title: 'Dependency Injection Demo Page'),
    );
  }
}

class MyQuotePage extends StatefulWidget {
  MyQuotePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyQuotePageState createState() => _MyQuotePageState();
}

class _MyQuotePageState extends State<MyQuotePage> {
  QuoteRepository _quoteRepository;

  Future<List> _futureQuote;

  @override
  void initState() {
    super.initState();
    _quoteRepository = QuoteRepository();
    _futureQuote = _quoteRepository.getQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: FutureBuilder<List<Quote>>(
              future: _futureQuote,
              builder: (context, AsyncSnapshot<List<Quote>> snapData) {
                if (snapData.connectionState == ConnectionState.waiting) {
                  return Center(child: Text('Please wait its loading...'));
                } else {
                  if (snapData.hasError)
                    return Center(child: Text('Error: ${snapData.error}'));
                  else
                    return ListView.builder(
                      itemCount: snapData.data.length,
                      itemBuilder: (context, index) =>
                          _quoteItem(snapData.data[index], index),
                    );
                }
              }),
        ));
  }

  Widget _quoteItem(Quote item, index) {
    return ListTile(
      tileColor: index % 2 == 0 ? Colors.white : Colors.grey.withOpacity(0.1),
      title: Text(
        '"${item.quote}"',
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text('- ${item.author}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
      ),
    );
  }
}
