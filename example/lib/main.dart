import 'package:flutter/material.dart';
import 'package:quotes_provider/quotes_provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String quote = '';
  String author = '';

  @override
  void initState() {
    super.initState();
    fetchQuote();
  }

  void fetchQuote() async {
    final dailyQuotesProvider = DailyQuotesProvider();
    final dailyQuote = await dailyQuotesProvider.getDailyQuote();
    setState(() {
      quote = dailyQuote.quote;
      author = dailyQuote.author;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Daily Quote App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                quote,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 10),
              Text(
                '- $author',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: fetchQuote,
                child: const Text('Get Daily Quote'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
