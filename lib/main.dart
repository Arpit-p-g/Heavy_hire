import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(HeavyHireApp());
}

class HeavyHireApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> machines = [
    {'image': 'assets/excavator.png', 'name': 'Excavator', 'desc': 'Heavy-duty digging machine'},
    {'image': 'assets/crane.png', 'name': 'Crane', 'desc': 'Lifting and transporting heavy materials'},
    {'image': 'assets/bulldozer.png', 'name': 'Bulldozer', 'desc': 'Used for pushing large quantities of soil'},
    {'image': 'assets/crane.png', 'name': 'Crane', 'desc': 'Lifting and transporting heavy materials'},
    {'image': 'assets/bulldozer.png', 'name': 'Bulldozer', 'desc': 'Used for pushing large quantities of soil'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Heavy Hire')),
      body: Center(
        child: ListWheelScrollView(
          itemExtent: 250,
          diameterRatio: 2,
          children: machines.map((machine) {
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingScreen(machine: machine),
                ),
              ),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(machine['image']!, height: 100),
                    Text(machine['name']!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(machine['desc']!, textAlign: TextAlign.center),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class BookingScreen extends StatefulWidget {
  final Map<String, String> machine;
  BookingScreen({required this.machine});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? startDate;
  DateTime? endDate;
  String? selectedPayment;
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        startDate = picked.start;
        endDate = picked.end;
      });
    }
  }

  void _confirmBooking() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Booking Confirmed"),
        content: Text("Your booking for ${widget.machine['name']} is confirmed!"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("OK"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book ${widget.machine['name']}")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Date Range", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selectDateRange(context),
              child: Text(startDate == null ? "Choose Date" : "${DateFormat.yMMMd().format(startDate!)} - ${DateFormat.yMMMd().format(endDate!)}"),
            ),
            SizedBox(height: 20),
            TextField(controller: nameController, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: contactController, decoration: InputDecoration(labelText: "Contact Number")),
            SizedBox(height: 20),
            Text("Payment Method", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: selectedPayment,
              hint: Text("Select Payment Option"),
              onChanged: (value) => setState(() => selectedPayment = value),
              items: ["PhonePe", "Google Pay", "Cash on Delivery"].map((option) {
                return DropdownMenuItem(value: option, child: Text(option));
              }).toList(),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _confirmBooking,
                child: Text("Confirm Booking"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
