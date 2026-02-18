import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CitySearchScreen extends StatefulWidget {
  const CitySearchScreen({super.key});

  @override
  State<CitySearchScreen> createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends State<CitySearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Sample data for suggestions
  final List<Map<String, dynamic>> _suggestions = [
    {
      'city': 'Los Angeles',
      'state': 'CA',
      'temp': '28°',
      'condition': 'Sunny',
      'icon': Icons.wb_sunny,
    },
    {
      'city': 'New York',
      'state': 'NY',
      'temp': '22°',
      'condition': 'Partly Cloudy',
      'icon': Icons.wb_cloudy,
    },
    {
      'city': 'Chicago',
      'state': 'IL',
      'temp': '18°',
      'condition': 'Cloudy',
      'icon': Icons.cloud,
    },
    {
      'city': 'Miami',
      'state': 'FL',
      'temp': '30°',
      'condition': 'Hot & Sunny',
      'icon': Icons.wb_sunny,
    },
    {
      'city': 'Seattle',
      'state': 'WA',
      'temp': '16°',
      'condition': 'Rainy',
      'icon': Icons.cloud_queue,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF060B1E), // Darker navy blue
              Color(0xFF0A1128), // Deep navy blue
              Color(0xFF001F54), // Royal blue
              Color(0xFF034078), // Medium blue
            ],
            stops: [0.0, 0.3, 0.6, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Back Button
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Title
                    Expanded(
                      child: Text(
                        'Search Cities',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 48), // Balance the back button
                  ],
                ),
              ),

              // Search Text Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1.5,
                        ),
                      ),
                      child: TextField(
                        controller: _searchController,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search for a city.....',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 16,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white.withOpacity(0.7),
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Current Location Text
                      Text(
                        'Current Location',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Current Location Widget
                      _buildCityWidget(
                        city: 'San Francisco',
                        state: 'CA',
                        temp: '24°',
                        condition: 'Mostly Cloudy',
                        icon: Icons.navigation,
                        isCurrentLocation: true,
                      ),
                      const SizedBox(height: 32),

                      // Suggestions Text
                      Text(
                        'Suggestions',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Suggestions List
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _suggestions.length,
                        itemBuilder: (context, index) {
                          final suggestion = _suggestions[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: _buildCityWidget(
                              city: suggestion['city'],
                              state: suggestion['state'],
                              temp: suggestion['temp'],
                              condition: suggestion['condition'],
                              icon: suggestion['icon'],
                              isCurrentLocation: false,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCityWidget({
    required String city,
    required String state,
    required String temp,
    required String condition,
    required IconData icon,
    required bool isCurrentLocation,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              // Icon
              Icon(
                icon,
                color: isCurrentLocation
                    ? Colors.white.withOpacity(0.9)
                    : Colors.amber.shade300,
                size: 32,
              ),
              const SizedBox(width: 16),

              // City Info Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // City Name with State
                    Row(
                      children: [
                        Text(
                          city,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          state,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    // Temperature and Condition
                    Row(
                      children: [
                        Text(
                          temp,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          condition,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
