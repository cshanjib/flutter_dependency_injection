import 'package:dependency_injection_demo/data/providers/quote_api_provider.dart';
import 'package:injectable/injectable.dart';

@injectable
class QuoteRepository {
  final QuoteApiProvider _provider;

  const QuoteRepository({QuoteApiProvider provider})
      : _provider = provider;

  Future<List> getQuotes() {
    return _provider.getQuotes();
  }
}
