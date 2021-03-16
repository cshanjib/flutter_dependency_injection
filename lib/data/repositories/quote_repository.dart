import 'package:dependency_injection_demo/data/providers/quote_api_provider.dart';
import 'package:injectable/injectable.dart';

@injectable
class QuoteRepository {
  final QuoteApiProvider _provider;
  final String _env;

  const QuoteRepository(
      {@Named("prod") QuoteApiProvider provider, @factoryParam env})
      : _env = env,
        _provider = provider;

  Future<List> getQuotes() {
    return _provider.getQuotes(_env);
  }
}
