import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(HeavyHireApp());
}

class HeavyHireApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.blue[800]),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
 final List<Vehicle> vehicles = [
  Vehicle(
    image: 'images/excavator.png',
    name: 'Excavator',
    desc: 'Heavy-duty digging machines for users',
    price: 2500,
    rating: 4.5,
    available: true,
    type: 'Earth Moving',
    features: [
      'Bucket Capacity: 1.2m³',
      'Engine Power: 110HP',
      'Operating Weight: 12T',
    ],
  ),
  Vehicle(
    image: 'images/crane.png',
    name: 'Tower Crane',
    desc: 'Lifting and transporting heavy materials',
    price: 3500,
    rating: 4.7,
    available: true,
    type: 'Lifting',
    features: [
      'Max Load: 20T',
      'Boom Length: 50m',
      'Jib Length: 60m',
    ],
  ),
  Vehicle(
    image: 'images/bulldozer.png',
    name: 'Bulldozer',
    desc: 'Used for pushing large quantities of soil',
    price: 2800,
    rating: 4.3,
    available: false,
    type: 'Earth Moving',
    features: [
      'Blade Capacity: 6.5m³',
      'Engine Power: 200HP',
      'Operating Weight: 22T',
    ],
  ),
  Vehicle(
    image: 'images/backhoe.png',
    name: 'Backhoe Loader',
    desc: 'Multi-purpose loader with backhoe arm',
    price: 2200,
    rating: 4.2,
    available: true,
    type: 'Earth Moving',
    features: [
      'Digging Depth: 4.3m',
      'Loader Capacity: 1m³',
      'Engine Power: 95HP',
    ],
  ),
  Vehicle(
    image: 'images/forklift.png',
    name: 'Forklift',
    desc: 'Used for lifting materials in warehouses',
    price: 1800,
    rating: 4.1,
    available: true,
    type: 'Lifting',
    features: [
      'Lifting Capacity: 3T',
      'Lift Height: 4m',
      'Electric Powered',
    ],
  ),
  Vehicle(
    image: 'images/roadroller.png',
    name: 'Road Roller',
    desc: 'Used for compacting soil, gravel and asphalt',
    price: 2400,
    rating: 4.0,
    available: false,
    type: 'Compaction',
    features: [
      'Drum Width: 2.1m',
      'Operating Weight: 10T',
      'Vibration Frequency: 35Hz',
    ],
  ),
  Vehicle(
    image: 'images/dumptruck.png',
    name: 'Dump Truck',
    desc: 'Transports loose material like sand and gravel',
    price: 3000,
    rating: 4.4,
    available: true,
    type: 'Hauling',
    features: [
      'Load Capacity: 16T',
      'Body Volume: 10m³',
      'Engine Power: 250HP',
    ],
  ),
  Vehicle(
    image: 'images/concretemixer.png',
    name: 'Concrete Mixer',
    desc: 'Mixes cement and aggregates for construction',
    price: 2700,
    rating: 4.3,
    available: true,
    type: 'Construction',
    features: [
      'Drum Capacity: 6m³',
      'Mixing Speed: 20 RPM',
      'Diesel Powered',
    ],
  ),
  Vehicle(
    image: 'images/grader.png',
    name: 'Motor Grader',
    desc: 'Used for leveling and finishing grade in roads',
    price: 3200,
    rating: 4.6,
    available: false,
    type: 'Earth Moving',
    features: [
      'Blade Width: 3.7m',
      'Engine Power: 175HP',
      'Hydraulic Controls',
    ],
  ),
  Vehicle(
    image: 'images/paver.png',
    name: 'Asphalt Paver',
    desc: 'Lays asphalt on roads and the parking lots',
    price: 4000,
    rating: 4.8,
    available: true,
    type: 'Paving',
    features: [
      'Paving Width: 6m',
      'Hopper Capacity: 10T',
      'Screed Vibration: Yes',
    ],
  ),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Heavy Hire',
          style: TextStyle(
            color: Colors.blue[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),

      body: Center(
        child: ListWheelScrollView(
          itemExtent: 250,
          diameterRatio: 2,
          children:
              vehicles.map((vehicle) {
                return GestureDetector(
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  VehicleDetailScreen(vehicle: vehicle),
                        ),
                      ),
                  child: 
                  
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 120,
                          child: Image.asset(
                            vehicle.image,
                            fit: BoxFit.contain,
                            errorBuilder:
                                (_, __, ___) => Icon(Icons.image, size: 60),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          vehicle.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '₹${vehicle.price}/day',
                          style: TextStyle(color: Colors.green),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            vehicle.desc,
                            textAlign: TextAlign.center,
                          ),
                        ),
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

class Vehicle {
  final String image;
  final String name;
  final String desc;
  final double price;
  final double rating;
  final bool available;
  final String type;
  final List<String> features;

  Vehicle({
    required this.image,
    required this.name,
    required this.desc,
    required this.price,
    required this.rating,
    required this.available,
    required this.type,
    required this.features,
  });
}

class VehicleDetailScreen extends StatelessWidget {
  final Vehicle vehicle;

  VehicleDetailScreen({required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vehicle.name),
        actions: [IconButton(icon: Icon(Icons.share), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
       Container(
  height: 250,
  width: double.infinity,
  child: vehicle.image != null && vehicle.image.isNotEmpty
      ? (vehicle.image.startsWith('http')
          ? Image.network(
              vehicle.image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Center(
                child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
              ),
            )
          : Image.asset(
              vehicle.image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Center(
                child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
              ),
            ))
      : Container(
          color: Colors.grey[200],
          child: Center(
            child: Icon(Icons.image, size: 50, color: Colors.grey),
          ),
        ),
),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        vehicle.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color:
                              vehicle.available
                                  ? Colors.green[100]
                                  : Colors.red[100],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          vehicle.available ? 'Available' : 'Booked',
                          style: TextStyle(
                            color:
                                vehicle.available
                                    ? Colors.green[800]
                                    : Colors.red[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 4),
                      Text('${vehicle.rating} (24 reviews)'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(vehicle.desc),
                  SizedBox(height: 16),
                  Text(
                    'Features',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        vehicle.features
                            .map(
                              (feature) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 16,
                                    ),
                                    SizedBox(width: 8),
                                    Text(feature),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Pricing',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.currency_rupee, color: Colors.green),
                      SizedBox(width: 8),
                      Text(
                        '${vehicle.price} per day',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => BookingScreen(vehicle: vehicle),
                          ),
                        );
                      },
                      child: Text('Book Now', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingScreen extends StatefulWidget {
  final Vehicle vehicle;
  BookingScreen({required this.vehicle});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? startDate;
  DateTime? endDate;
  String? selectedPayment;
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  bool showPaymentForm = false;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  String? phoneError;

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        startDate = picked.start;
        endDate = picked.end;
      });
    }
  }

  Future<void> _launchPhonePe() async {
    const url =
        'upi://pay?pa=merchantvpa@upi&pn=HeavyHire&am=12500&tn=VehicleBooking';

    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        // Fallback: Open Play Store if app is not installed
        const playStoreUrl =
            'https://play.google.com/store/apps/details?id=com.phonepe.app';
        if (await canLaunch(playStoreUrl)) {
          await launch(playStoreUrl);
        } else {
          throw 'Could not open PhonePe or Play Store';
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not open PhonePe: $e')));
    }
  }

  bool _validatePhoneNumber(String phone) {
    // Remove any non-digit characters
    String digits = phone.replaceAll(RegExp(r'[^0-9]'), '');
    return digits.length == 10;
  }

  void _processPayment() {
    // Validate phone number
    if (!_validatePhoneNumber(contactController.text)) {
      setState(() {
        phoneError = 'Please enter a valid 10-digit phone number';
      });
      return;
    } else {
      setState(() {
        phoneError = null;
      });
    }

    if (selectedPayment == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please select a payment method')));
      return;
    }

    if (startDate == null || endDate == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please select date range')));
      return;
    }

    if (nameController.text.isEmpty || contactController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please fill your details')));
      return;
    }

    // Calculate price (5 days * vehicle price for demo)
    final days = endDate!.difference(startDate!).inDays + 1;
    final double totalPrice = days * widget.vehicle.price;

    if (selectedPayment == 'Credit/Debit Card') {
      _showCardPaymentDialog(totalPrice);
    } else if (selectedPayment == 'PhonePe') {
      _launchPhonePe();
      // After returning from PhonePe, show confirmation
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // _showPaymentSuccess(totalPrice);
      });
    } else if (selectedPayment == 'Cash on Delivery') {
      _showCashOnDeliverySuccess(totalPrice);
    }
  }

  void _showCashOnDeliverySuccess(double amount) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, color: Colors.green, size: 60),
              ),
              SizedBox(height: 20),
              Text(
                'Order Placed Successfully!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      '₹${amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Cash on Delivery',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Your ${widget.vehicle.name} will be delivered as per schedule',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(color: Colors.blue),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'View Details',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCardPaymentDialog(double amount) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Card Payment'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Amount: ₹$amount'),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Card Number',
                    hintText: '1234 5678 9012 3456',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => cardNumber = value,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Expiry (MM/YY)',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) => expiryDate = value,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'CVV',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        onChanged: (value) => cvvCode = value,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Card Holder Name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => cardHolderName = value,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _showPaymentSuccess(amount);
                },
                child: Text('Pay ₹$amount'),
              ),
            ],
          ),
    );
  }

  void _showPaymentSuccess(double amount) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 60),
                  SizedBox(height: 20),
                  Text(
                    'Payment Successful!',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '₹$amount',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Paid via ${selectedPayment ?? ''}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Booking confirmed for ${widget.vehicle.name}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: Text('Done', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final days =
        startDate != null && endDate != null
            ? endDate!.difference(startDate!).inDays + 1
            : 0;
    final totalPrice = days * widget.vehicle.price;

    return Scaffold(
      appBar: AppBar(title: Text("Book ${widget.vehicle.name}")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Booking Summary",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Daily Rate:"),
                        Text("₹${widget.vehicle.price.toStringAsFixed(2)}"),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Selected Dates:"),
                        Text(
                          startDate != null
                              ? "${DateFormat('MMM d').format(startDate!)} - ${DateFormat('MMM d').format(endDate!)}"
                              : "Not selected",
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Duration:"),
                        Text("$days day${days != 1 ? 's' : ''}"),
                      ],
                    ),
                    Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Price:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "₹${totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue[800],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Select Date Range",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => _selectDateRange(context),
              child: Text(
                startDate == null
                    ? "Choose Dates"
                    : "${DateFormat('MMM d, y').format(startDate!)} - ${DateFormat('MMM d, y').format(endDate!)}",
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Your Information",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Full Name",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: contactController,
              decoration: InputDecoration(
                labelText: "Contact Number",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
                errorText: phoneError,
              ),
              keyboardType: TextInputType.phone,
              maxLength: 10,
              onChanged: (value) {
                if (value.length == 10) {
                  setState(() {
                    phoneError = null;
                  });
                }
              },
            ),
            SizedBox(height: 16),
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: "Delivery Location (optional)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on),
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Payment Method",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            PaymentMethodCard(
              icon: Icons.credit_card,
              title: "Credit/Debit Card",
              isSelected: selectedPayment == "Credit/Debit Card",
              onTap: () {
                setState(() {
                  selectedPayment = "Credit/Debit Card";
                  showPaymentForm = true;
                });
              },
            ),
            SizedBox(height: 8),
            PaymentMethodCard(
              icon: Icons.phone_android,
              title: "PhonePe",
              isSelected: selectedPayment == "PhonePe",
              onTap: () {
                setState(() {
                  selectedPayment = "PhonePe";
                  showPaymentForm = false;
                });
              },
            ),
            SizedBox(height: 8),
            PaymentMethodCard(
              icon: Icons.money,
              title: "Cash on Delivery",
              isSelected: selectedPayment == "Cash on Delivery",
              onTap: () {
                setState(() {
                  selectedPayment = "Cash on Delivery";
                  showPaymentForm = false;
                });
              },
            ),
            if (showPaymentForm) ...[
              SizedBox(height: 24),
              Container(
                height: 200,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [Colors.blue[800]!, Colors.blue[600]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "VISA",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      cardNumber.isEmpty ? "•••• •••• •••• ••••" : cardNumber,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CARD HOLDER",
                              style: TextStyle(color: Colors.white70),
                            ),
                            Text(
                              cardHolderName.isEmpty
                                  ? "YOUR NAME"
                                  : cardHolderName,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(width: 40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "EXPIRES",
                              style: TextStyle(color: Colors.white70),
                            ),
                            Text(
                              expiryDate.isEmpty ? "••/••" : expiryDate,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _processPayment,
                child: Text(
                  "Proceed to Payment",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  PaymentMethodCard({
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isSelected ? 2 : 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: isSelected ? Colors.blue : Colors.grey[300]!,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, color: isSelected ? Colors.blue : Colors.grey),
              SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              Spacer(),
              if (isSelected) Icon(Icons.check_circle, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Profile')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue[100],
              child: Icon(Icons.person, size: 50, color: Colors.blue[800]),
            ),
            SizedBox(height: 16),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text('john.doe@example.com', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 24),
            ListTile(
              leading: Icon(Icons.history, color: Colors.blue),
              title: Text('Booking History'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingHistoryScreen(),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.payment, color: Colors.green),
              title: Text('Payment Methods'),
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.grey),
              title: Text('Settings'),
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help, color: Colors.orange),
              title: Text('Help & Support'),
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(),
            SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[100],
                foregroundColor: Colors.red,
                minimumSize: Size(double.infinity, 48),
              ),
              onPressed: () {},
              child: Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingHistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> bookings = [
    {
      'vehicle': 'Excavator',
      'date': 'Jun 15-20, 2023',
      'status': 'Completed',
      'price': 12500.00,
    },
    {
      'vehicle': 'Tower Crane',
      'date': 'Jul 1-10, 2023',
      'status': 'Upcoming',
      'price': 35000.00,
    },
    {
      'vehicle': 'Bulldozer',
      'date': 'May 5-7, 2023',
      'status': 'Completed',
      'price': 8400.00,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Booking History')),
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: Icon(Icons.image, color: Colors.grey),
              ),
              title: Text(
                booking['vehicle'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(booking['date']),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color:
                              booking['status'] == 'Completed'
                                  ? Colors.green[100]
                                  : Colors.blue[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          booking['status'],
                          style: TextStyle(
                            color:
                                booking['status'] == 'Completed'
                                    ? Colors.green[800]
                                    : Colors.blue[800],
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '₹${booking['price'].toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '5 days',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}