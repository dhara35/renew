import 'package:flutter/material.dart';
import 'package:renew/widgets/footer_widget.dart';

class MeetingPage extends StatelessWidget {
  const MeetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting Page'),
      ),
      body: const Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'This is the meeting page',
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
