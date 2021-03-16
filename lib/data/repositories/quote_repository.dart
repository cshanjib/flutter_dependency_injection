import 'package:dependency_injection_demo/data/providers/quote_api_provider.dart';

class QuoteRepository {
  final QuoteApiProvider _provider;

  const QuoteRepository({provider})
      : _provider = provider ?? const MockQuoteApiProvider();

  Future<List> getQuotes() {
    return _provider.getQuotes();
  }
}
