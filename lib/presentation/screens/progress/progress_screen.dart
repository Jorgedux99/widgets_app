import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {

  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Screen'),
      ),
      body: _ProgressView()
    );
  }
}

class _ProgressView extends StatelessWidget{
  
  
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text('Circula progress indicator'),
          SizedBox(height: 10),
          CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black12),
          _ControlledProgressIndicator()
        ],
      ),
    );
  }

}

class _ControlledProgressIndicator extends StatelessWidget{
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (computationCount) {
        return (computationCount * 2) / 50;

      }).takeWhile((value) => value < 50 ),

      builder: (context, snapshot) {

        final progressValue = snapshot.data ?? 0;

      return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(value: progressValue, strokeWidth: 2, backgroundColor: Colors.black12),
          const SizedBox(width: 20),
          Expanded(
            child: LinearProgressIndicator(value: progressValue))
        ],
        )
      );
      }
    );
  
  }
}

