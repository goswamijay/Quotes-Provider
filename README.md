# Quotes Provider Package

A Dart package for fetching and retrieving daily quotes from the API.

## Installation

To use this package, add `quotes_provider` as a dependency in your `pubspec.yaml` file:

```
yaml
dependencies:
  quotes_provider: ^0.0.1 
```

Then, run flutter pub get to fetch the package.

## Usage

Import the package in your Dart file:

```
import 'package:quotes_provider/quotes_provider.dart';
```

Instantiate the DailyQuotesProvider class and use it to get daily quotes:

```
final dailyQuotesProvider = DailyQuotesProvider();
final dailyQuote = await dailyQuotesProvider.getDailyQuote();
String quote = dailyQuote.quote;
String author = dailyQuote.author;
```

The getDailyQuote method fetches a random daily quote from the API and returns it as a DailyQuote object, containing the quote text and author.

## Example

Here's a simple example of how you can use this package to display a daily quote in your Dart application:

```
import 'package:flutter/material.dart';
import 'package:quotes_provider/quotes_provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Daily Quote App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                quote,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 10),
              Text(
                '- $author',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: fetchQuote,
                child: Text('Get Daily Quote'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```
This example demonstrates a Flutter application that displays a daily quote and author retrieved using the `quotes_provider` package.


## Features and Contributions

If you have any feature requests or would like to contribute to this package, please feel free to create an issue or a pull request on the GitHub repository.