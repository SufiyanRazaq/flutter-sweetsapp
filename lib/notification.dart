import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsPage extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': '50% Off on All Sweets!',
      'message':
          'Celebrate this festive season with half the price on all sweets. Offer valid till Jan 15, 2025.',
      'type': 'Promotional',
      'time': '2 hours ago',
    },
    {
      'title': 'Your Order #123456789 is Delivered',
      'message':
          'We hope you enjoyed your Sweets! Thank you for shopping with us.',
      'type': 'Order Update',
      'time': '1 day ago',
    },
    {
      'title': 'New Arrivals: Winter Special Sweets',
      'message':
          'Try our new Gajar Halwa and other winter delicacies now available in the store.',
      'type': 'Promotional',
      'time': '3 days ago',
    },
  ];

  NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f6f1),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xff581f59),
        title: Text(
          'Notifications',
          style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
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
          notifications.isEmpty
              ? Center(
                  child: Text(
                    'No new notifications!',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    notification['title'],
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    notification['time'],
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: 11,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                notification['message'],
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: notification['type'] == 'Promotional'
                                        ? Colors.orangeAccent.withOpacity(0.2)
                                        : Colors.greenAccent.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    notification['type'],
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: 12,
                                      color:
                                          notification['type'] == 'Promotional'
                                              ? Colors.orangeAccent
                                              : Colors.greenAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
