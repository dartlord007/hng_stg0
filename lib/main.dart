import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('HNG Stage Zero Task'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UrlButton(
                url: 'https://github.com/dartlord007',
                buttonText: 'GitHub Profile',
              ),
              SizedBox(height: 20), // Spacing between buttons
              UrlButton(
                url: 'http://hng.tech/hire/flutter-developers',
                buttonText: 'Hire HNG Flutter Developers',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Centralized widget for handling URL launches
class UrlButton extends StatelessWidget {
  final String url;
  final String buttonText;

  const UrlButton({
    super.key,
    required this.url,
    required this.buttonText,
  });

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _launchUrl,
      child: Text(buttonText),
    );
  }
}