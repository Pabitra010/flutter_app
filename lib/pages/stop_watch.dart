import 'package:flutter/material.dart';
import 'dart:async';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  late Timer _timer;
  int _milliseconds = 0;
  bool _isRunning = false;

  void _startStopwatch() {
    if (_isRunning) {
      _timer.cancel();
    } else {
      _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        setState(() {
          _milliseconds++;
        });
      });
    }

    setState(() {
      _isRunning = !_isRunning;
    });
  }

  void _resetStopwatch() {
    if (_isRunning) _timer.cancel();
    setState(() {
      _milliseconds = 0;
      _isRunning = false;
    });
  }

  String _formatTime(int milliseconds) {
    int minutes = milliseconds ~/ 600;
    int seconds = (milliseconds % 600) ~/ 10;
    int millis = milliseconds % 10;
    return '${minutes.toString().padLeft(2, '0')}:'
           '${seconds.toString().padLeft(2, '0')}:'
           '${(millis * 100).toString().padLeft(3, '0')}';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 167, 53),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display
              Text(
                _formatTime(_milliseconds),
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 241, 96, 39),
                ),
              ),
              SizedBox(height: 60),

              // Start/Stop Button
              ElevatedButton(
                onPressed: _startStopwatch,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _isRunning
                          ? Colors.red
                          : const Color.fromARGB(255, 236, 134, 0),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _isRunning ? 'Stop' : 'Start',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),

              // Reset Button
              ElevatedButton(
                onPressed: _resetStopwatch,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Reset',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
