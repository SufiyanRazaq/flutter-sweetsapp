import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweetsapp/Favourite.dart';
import 'package:sweetsapp/about.dart';
import 'package:sweetsapp/cart.dart';
import 'package:sweetsapp/notification.dart';
import 'package:sweetsapp/orderhistory.dart';
import 'package:sweetsapp/productdetail.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:sweetsapp/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _advancedDrawerController = AdvancedDrawerController();
  final featuredMithaiTitles = [
    'Delicious Halwa',
    'Crispy Samosa',
    'Premium Pehni',
    'Authentic Laddu',
    'Special Gulab Jamun',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AdvancedDrawer(
        backdropColor: const Color(0xff581f59),
        controller: _advancedDrawerController,
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        drawer: const CustomDrawer(), // Use the custom drawer
        child: Scaffold(
          body: Stack(
            children: [
              // Background Gradient with Blur Effect
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff581f59), Color(0xffa72729)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),

              // Page Content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Menu Icon
                        IconButton(
                          icon: const Icon(Icons.menu,
                              color: Colors.orangeAccent),
                          onPressed: () {
                            _advancedDrawerController
                                .showDrawer(); // Open Drawer
                          },
                        ),
                        const SizedBox(width: 15),
                        const Icon(Icons.location_on,
                            color: Colors.orangeAccent),
                        const SizedBox(width: 5),
                        Text(
                          'Karachi, Pakistan',
                          style: GoogleFonts.aBeeZee(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        // Cart Icon
                        Stack(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.shopping_cart,
                                  color: Colors.orangeAccent),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CartPage()),
                                );
                              },
                            ),
                            Positioned(
                              right: 0,
                              top: 5,
                              child: Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: const Center(
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.white70),
                        hintText: 'Search for Mithai',
                        hintStyle: GoogleFonts.aBeeZee(color: Colors.white54),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.orangeAccent),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),

                  // Sections (Scrollable Content)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Featured Mithai (Carousel)
                          const SectionTitle(title: 'Featured Mithai'),
                          FeaturedMithaiCarousel(
                              featuredMithaiTitles: featuredMithaiTitles),

                          // Categories
                          const SectionTitle(title: 'Categories'),
                          const MithaiCategories(),

                          // Bestsellers
                          const SectionTitle(title: 'Bestsellers'),
                          const ProductList(),

                          // Discounts
                          const SectionTitle(title: 'Discounts'),
                          const ProductList(),

                          // Seasonal Specials
                          const SectionTitle(title: 'Seasonal Specials'),
                          const ProductList(),
                        ],
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
}

// Section Title Widget
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: GoogleFonts.aBeeZee(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}

// Mithai Categories
class MithaiCategories extends StatelessWidget {
  const MithaiCategories({super.key});

  final List<String> categories = const [
    'Laddu',
    'Barfi',
    'Jalebi',
    'Peda',
    'Halwa'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
            ),
            child: Center(
              child: Text(
                categories[index],
                style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to ProductDetailsPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    productName: 'Mithai ${index + 1}',
                    price: (index + 1) * 100,
                    description:
                        'This is the description for Mithai ${index + 1}. Delicious, sweet, and perfect for every occasion!',
                    imagePath: 'assets/product${index + 3}.png',
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/product${index + 3}.png'), // Replace with your assets
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Mithai ${index + 1}',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 16,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Rs. ${(index + 1) * 100}',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 14,
                        color: Colors.orangeAccent,
                      ),
                    ),
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

class FeaturedMithaiCarousel extends StatefulWidget {
  final List<String> featuredMithaiTitles;

  const FeaturedMithaiCarousel({super.key, required this.featuredMithaiTitles});

  @override
  _FeaturedMithaiCarouselState createState() => _FeaturedMithaiCarouselState();
}

class _FeaturedMithaiCarouselState extends State<FeaturedMithaiCarousel> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _carouselTimer;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _carouselTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      setState(() {
        _opacity = 0.0; // Start fade out
      });

      Future.delayed(const Duration(milliseconds: 500), () {
        if (_currentPage < widget.featuredMithaiTitles.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );

        setState(() {
          _opacity = 1.0; // Fade in the next slide
        });
      });
    });
  }

  @override
  void dispose() {
    _carouselTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.featuredMithaiTitles.length,
        itemBuilder: (context, index) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: _opacity,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage('assets/${index + 1}.jpg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.featuredMithaiTitles[index],
                      style: GoogleFonts.aBeeZee(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff581f59), Color(0xffa72729)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drawer Header with Glass Effect
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/logo.jpg'),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Hello, User',
                          style: GoogleFonts.pacifico(
                            fontSize: 22,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.orangeAccent.withOpacity(0.7),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Welcome Back',
                          style: GoogleFonts.aBeeZee(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const Divider(color: Colors.white70, thickness: 1),

            // Drawer Menu Items
            buildDrawerItem(
              context,
              icon: Icons.history,
              title: 'Order History',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderHistoryPage()),
                );
              },
            ),
            buildDrawerItem(
              context,
              icon: Icons.favorite,
              title: 'Favorite',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoritesPage()),
                );
              },
            ),
            buildDrawerItem(
              context,
              icon: Icons.notifications,
              title: 'Notification',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsPage()),
                );
              },
            ),
            buildDrawerItem(
              context,
              icon: Icons.contact_page,
              title: 'About',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutContactPage()),
                );
              },
            ),
            buildDrawerItem(
              context,
              icon: Icons.person,
              title: 'Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfilePage()),
                );
              },
            ),

            const Spacer(),

            // Logout Button
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  // Add logout logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff69722),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.logout, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(
                      'Logout',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Drawer Item Builder
  Widget buildDrawerItem(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.orangeAccent,
        size: 20,
      ),
      title: Text(
        title,
        style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 14),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      tileColor: Colors.white.withOpacity(0.1),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
    );
  }
}
