import 'package:flutter/material.dart';

class AdminSidebar extends StatelessWidget {
  const AdminSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFF1976D2), width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Admin",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1976D2),
                ),
              ),
              const SizedBox(height: 20),
          
              // Profile Card
              Card(
                elevation:5,
                clipBehavior: Clip.antiAlias,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.blue.shade100,
                        // backgroundImage: AssetImage('assets/images/profile.png'), // Replace with your asset
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "John Doe",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Mentor",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Divider(height: 1),
                      _buildNavItem(Icons.calendar_today_outlined, "Schedular"),
                      _buildNavItem(Icons.access_time, "Timesheet"),
                      _buildNavItem(Icons.chat_outlined, "Discussions"),
                      _buildNavItem(Icons.insert_drive_file_outlined, "Reports"),
                      _buildNavItem(Icons.feedback_outlined, "Feedback"),
                      _buildNavItem(Icons.emoji_events_outlined, "Certificates"),
                      _buildNavItem(Icons.article_outlined, "Feed"),
                      _buildNavItem(Icons.analytics_outlined, "Analytics"),
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

  Widget _buildNavItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(title),
      dense: true,
      // horizontalTitleGap: 0,
    );
  }
}
