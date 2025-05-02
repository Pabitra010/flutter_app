import "package:flutter/material.dart";
import "dart:math";

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _radiusController = TextEditingController();
  String _selectedOption = 'Area';
  String _result = '';

  void _calculate() {
    final radius = double.tryParse(_radiusController.text.trim());

    if (radius == null || radius < 0) {
      setState(() {
        _result = 'Please enter a valid positive radius.';
      });
      return;
    }

    double output;
    if (_selectedOption == 'Area') {
      output = pi * pow(radius, 2);
      _result = 'Area = ${output.toStringAsFixed(2)}';
    } else {
      output = 2 * pi * radius;
      _result = 'Circumference = ${output.toStringAsFixed(2)}';
    }

    setState(() {});
  }

  void _reset() {
    setState(() {
      _radiusController.clear();
      _selectedOption = 'Area';
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Circle Calculator"),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _radiusController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Enter Radius",
                prefixIcon: Icon(Icons.circle_outlined),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedOption,
              decoration: InputDecoration(
                labelText: 'Select Calculation',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items:
                  ['Area', 'Circumference']
                      .map(
                        (value) =>
                            DropdownMenuItem(value: value, child: Text(value)),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _calculate,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                    ),
                    child: Text("Calculate"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _reset,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                    ),
                    child: Text("Reset"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            if (_result.isNotEmpty)
              Card(
                elevation: 4,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    _result,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.indigo,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
