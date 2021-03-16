import 'package:dependency_injection_demo/data/models/quote.dart';
import 'package:injectable/injectable.dart';

abstract class QuoteApiProvider {
  const QuoteApiProvider();

  Future<List> getQuotes(String env);
}

@Singleton(as: QuoteApiProvider)
class MockQuoteApiProvider implements QuoteApiProvider {
  const MockQuoteApiProvider();

  Future<List<Quote>> getQuotes(String env) async {
    //add some delay to give the feel of api call
    await Future.delayed(Duration(seconds: 3));
    return Future.value([
      Quote(quote: "Simplicity is a great virtue - $env.", author: "Edsger Wybe Dijkstra"),
      Quote(quote: "Progress and don't look back.", author: "Michael Nielsen")
    ]);
  }
}

@Named("prod")
@Singleton(as: QuoteApiProvider)
class RealQuoteApiProvider implements QuoteApiProvider {
  const RealQuoteApiProvider();

  Future<List<Quote>> getQuotes(String env) async {
    //add some delay to give the feel of api call

    await Future.delayed(Duration(seconds: 3));
    return Future.value([
      Quote(quote: "Simplicity is a great virtue from production - $env.", author: "Edsger Wybe Dijkstra"),
      Quote(quote: "Progress and don't look back.", author: "Michael Nielsen")
    ]);
  }
}
