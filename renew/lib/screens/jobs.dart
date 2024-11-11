import 'package:flutter/material.dart';
import 'package:renew/widgets/footer_widget.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Page'),
      ),
      body: const Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'This is the job page',
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
