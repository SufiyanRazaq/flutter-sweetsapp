import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweetsapp/Screens/orderconfim.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String? selectedPaymentMethod = 'Cash on Delivery';
  final TextEditingController addressController =
      TextEditingController(text: "123 Main Street, Karachi, Pakistan");

  final List<Map<String, dynamic>> orderSummary = [
    {'name': 'Delicious Gulab Jamun', 'price': 250, 'quantity': 1},
    {'name': 'Crispy Jalebi', 'price': 300, 'quantity': 2},
    {'name': 'Special Motichoor Laddu', 'price': 400, 'quantity': 1},
  ];

  double get subtotal => orderSummary.fold(
      0, (sum, item) => sum + item['price'] * item['quantity']);
  double get discount => subtotal * 0.1; // 10% Discount
  double get totalAmount => subtotal - discount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f6f1),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff581f59), Color(0xffa72729)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Checkout',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSectionHeader('Delivery Address'),
                      buildGlassyContainer(
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: addressController,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  hintText: 'Enter your address',
                                  hintStyle: TextStyle(color: Colors.white70),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit,
                                  color: Colors.orangeAccent),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      buildSectionHeader('Payment Method'),
                      buildPaymentOptions(),
                      const SizedBox(height: 20),
                      buildSectionHeader('Order Summary'),
                      buildOrderSummary(),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const OrderConfirmationPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff69722),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'Place Order',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: GoogleFonts.aBeeZee(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildGlassyContainer({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  Widget buildPaymentOptions() {
    return Column(
      children: [
        buildPaymentOption('Cash on Delivery'),
        buildPaymentOption('Credit/Debit Card'),
        buildPaymentOption('UPI'),
      ],
    );
  }

  Widget buildPaymentOption(String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = title;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: selectedPaymentMethod == title
              ? Colors.orangeAccent.withOpacity(0.3)
              : Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        child: ListTile(
          leading: Icon(
            selectedPaymentMethod == title
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: Colors.orangeAccent,
          ),
          title: Text(
            title,
            style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget buildOrderSummary() {
    return buildGlassyContainer(
      child: Column(
        children: [
          ...orderSummary.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${item['name']} x${item['quantity']}',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Rs. ${item['price'] * item['quantity']}',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 12,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          const Divider(color: Colors.white70, thickness: 1),
          buildPriceRow('Subtotal:', subtotal),
          buildPriceRow('Discount (10%):', -discount),
          const Divider(color: Colors.white70, thickness: 1),
          buildPriceRow('Total:', totalAmount, isBold: true),
        ],
      ),
    );
  }

  Widget buildPriceRow(String label, double amount, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.aBeeZee(
              fontSize: isBold ? 16 : 14, color: Colors.white),
        ),
        Text(
          'Rs. ${amount.toStringAsFixed(0)}',
          style: GoogleFonts.aBeeZee(
            fontSize: isBold ? 16 : 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: Colors.orangeAccent,
          ),
        ),
      ],
    );
  }
}
