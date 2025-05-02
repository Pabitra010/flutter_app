import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _billController = TextEditingController();
  final TextEditingController _tipController = TextEditingController();

  double? _totalBill;
  double? _tipAmount;

  void _calculateTis() {
    final bill = double.tryParse(_billController.text.trim());
    final tip = double.tryParse(_tipController.text.trim());
    if (bill != null && tip!= null) {
      setState(() {
        _tipAmount = bill * (tip / 100);
        _totalBill = bill + _tipAmount!;
      });
    }
  }

  void reset() {
    setState(() {
      _billController.clear();
      _tipController.clear();
      _totalBill = null;
      _tipAmount = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIP CALCULATOR"),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _billController,
              decoration: InputDecoration(
                labelText: "Enter your bill amount",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _tipController,
              decoration: InputDecoration(
                labelText: "Enter tip percentage",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _calculateTis,
                  child: Text("Calculate"),
                ),
                ElevatedButton(
                  onPressed: reset,
                  child: Text("Reset"),
                ),
              ],
            ),
            SizedBox(height: 20),
            if(_totalBill != null && _tipAmount != null)
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                children: [
                  Text(
                    "Tip Amount: \$${_tipAmount!.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Total Bill: \$${_totalBill!.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              )  
            )
          ],
        ),
      ),
    );
  }
}
