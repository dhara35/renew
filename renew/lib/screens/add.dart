import 'package:flutter/material.dart';
import 'package:renew/widgets/footer_widget.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Page'),
      ),
      body: const Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'This is the Add page',
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
