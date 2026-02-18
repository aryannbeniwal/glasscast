import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isCelsius = true;
  bool _isKmh = true;
  bool _rainAlertsEnabled = true;

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
            children: [
              // App Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Settings',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),

                      // Preferences Section
                      Text(
                        'Preferences',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Preferences Widget
                      _buildPreferencesWidget(),
                      const SizedBox(height: 32),

                      // Account Section
                      Text(
                        'Account',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Account Widget
                      _buildAccountWidget(),
                      const SizedBox(height: 32),

                      // App Version Info
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Version 1.0.0',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Built with precision in Gurugram',
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: Colors.white.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Sign Out Button
                      _buildSignOutButton(),
                      const SizedBox(height: 32),
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

  Widget _buildPreferencesWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              // Temperature Unit Row
              _buildPreferenceRow(
                icon: Icons.thermostat,
                label: 'Temperature Unit',
                value: _isCelsius ? '°C' : '°F',
                isToggled: _isCelsius,
                onToggle: (value) {
                  setState(() {
                    _isCelsius = value;
                  });
                },
              ),

              // Divider
              Divider(
                color: Colors.white.withOpacity(0.2),
                thickness: 1,
                height: 1,
              ),

              // Wind Speed Unit Row
              _buildPreferenceRow(
                icon: Icons.air,
                label: 'Wind Speed Unit',
                value: _isKmh ? 'KM/H' : 'MPH',
                isToggled: _isKmh,
                onToggle: (value) {
                  setState(() {
                    _isKmh = value;
                  });
                },
              ),

              // Divider
              Divider(
                color: Colors.white.withOpacity(0.2),
                thickness: 1,
                height: 1,
              ),

              // Rain Alerts Row
              _buildPreferenceRow(
                icon: Icons.umbrella,
                label: 'Rain Alerts',
                value: '',
                isToggled: _rainAlertsEnabled,
                onToggle: (value) {
                  setState(() {
                    _rainAlertsEnabled = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreferenceRow({
    required IconData icon,
    required String label,
    required String value,
    required bool isToggled,
    required Function(bool) onToggle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white.withOpacity(0.8),
            size: 24,
          ),
          const SizedBox(width: 16),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          if (value.isNotEmpty) ...[
            const SizedBox(width: 8),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ],
          const Spacer(),
          Switch(
            value: isToggled,
            onChanged: onToggle,
            activeColor: Colors.blue.shade400,
            activeTrackColor: Colors.blue.shade200,
            inactiveThumbColor: Colors.grey.shade400,
            inactiveTrackColor: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }

  Widget _buildAccountWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              // Profile Row
              _buildAccountRow(
                icon: Icons.person,
                title: 'John Doe',
                subtitle: 'johndoe@example.com',
                onTap: () {
                  // TODO: Navigate to profile settings
                },
              ),

              // Divider
              Divider(
                color: Colors.white.withOpacity(0.2),
                thickness: 1,
                height: 1,
              ),

              // Notifications Row
              _buildAccountRow(
                icon: Icons.notifications,
                title: 'Notifications',
                subtitle: 'Manage your notification preferences',
                onTap: () {
                  // TODO: Navigate to notification settings
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountRow({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white.withOpacity(0.8),
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white.withOpacity(0.5),
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignOutButton() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.red.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // TODO: Show sign out confirmation dialog
                  _showSignOutDialog();
                },
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.red.shade300,
                        size: 22,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Sign Out',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.red.shade300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSignOutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            backgroundColor: const Color(0xFF0A1128),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: Colors.white.withOpacity(0.2),
                width: 1.5,
              ),
            ),
            title: Text(
              'Sign Out',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            content: Text(
              'Are you sure you want to sign out?',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // TODO: Implement sign out logic
                },
                child: Text(
                  'Sign Out',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.red.shade300,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
