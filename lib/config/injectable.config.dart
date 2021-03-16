// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/providers/quote_api_provider.dart' as _i4;
import '../data/repositories/quote_repository.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.QuoteRepository>(
      () => _i3.QuoteRepository(provider: get<_i4.QuoteApiProvider>()));
  gh.singleton<_i4.QuoteApiProvider>(_i4.MockQuoteApiProvider());
  return get;
}
