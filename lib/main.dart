import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  final List _data = [
    {
      "tags": ["software engineering", "programming", "design", "marketing"],
      "quote":
          "Simplicity is a great virtue but it requires hard work to achieve it and education to appreciate it. And to make matters worse: complexity sells better.",
      "lang": "en",
      "author": "Edsger Wybe Dijkstra"
    },
    {
      "tags": ["science", "short", "ux", "knowledge", "ui", "software"],
      "quote":
          "One consequence of reifying deep principles in an interface is that mastering the subject begins to coincide with mastering the interface.",
      "lang": "en",
      "author": "Michael Nielsen"
    },
    {
      "tags": ["short", "effective altruism", "impact"],
      "quote":
          "If you can help 1000 people be 1% more effective, then that’s like having the impact of 10 people.",
      "lang": "en",
      "author": "Ben Todd"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: _data.length,
            itemBuilder: (context, index) => _quoteItem(_data[index], index),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  _quoteItem(item, index) {
    return ListTile(
      tileColor: index % 2 == 0 ? Colors.white : Colors.grey.withOpacity(0.1),
      title: Text(
        '"${item["quote"]}"',
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text('- ${item["author"]}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
      ),
    );
  }
}
