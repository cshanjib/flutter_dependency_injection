// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quote _$QuoteFromJson(Map<String, dynamic> json) {
  return Quote(
    quote: json['quote'] as String,
    author: json['author'] as String,
    lang: json['lang'] as String,
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$QuoteToJson(Quote instance) => <String, dynamic>{
      'quote': instance.quote,
      'author': instance.author,
      'lang': instance.lang,
      'tags': instance.tags,
    };

QuoteList _$QuoteListFromJson(Map<String, dynamic> json) {
  return QuoteList(
    quotes: (json['quotes'] as List)
        ?.map(
            (e) => e == null ? null : Quote.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$QuoteListToJson(QuoteList instance) => <String, dynamic>{
      'quotes': instance.quotes,
    };
