library quotes_provider;

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class DailyQuotesProvider {
  Future<DailyQuote> getDailyQuote() async {
    final response = await http.get(Uri.parse('https://type.fit/api/quotes'));

    if (response.statusCode == 200) {
      final List<dynamic> quotesJson = json.decode(response.body);
      Random random = Random();
      final randomIndex = random.nextInt(quotesJson.length);
      final quote = quotesJson[randomIndex]['text'] as String;
      final author1 = quotesJson[randomIndex]['author'] as String;
      String author = author1.replaceAll(', type.fit', '');
      return DailyQuote(quote, author);
    } else {
      throw Exception('Failed to load quotes');
    }
  }
}

class DailyQuote {
  final String quote;
  final String author;

  DailyQuote(this.quote, this.author);
}
