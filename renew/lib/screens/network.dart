import 'package:flutter/material.dart';
import 'package:renew/widgets/footer_widget.dart';

class NetworkPage extends StatelessWidget {
  const NetworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Page'),
      ),
      body: const Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'This is the network page',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          FooterWidget(),
        ],
      ),
    );
  }
}
