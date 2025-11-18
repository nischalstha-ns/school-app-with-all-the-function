import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages.dart';
import 'more_pages.dart';

void main() {
  runApp(const MountGloryApp());
}

class MountGloryApp extends StatelessWidget {
  const MountGloryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mount Glory English Boarding High School',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  
  // Method to return the appropriate page content based on selected index
  Widget _getPageContent(int index) {
    switch (index) {
      case 0: // Dashboard
        return const DashboardContent();
      case 1: // Teachers
        return const TeachersPage();
      case 2: // Students
        return const StudentsPage();
      case 3: // Attendance
        return const AttendancePage();
      case 4: // Finance
        return const FinancePage();
      case 5: // Notice
        return const NoticePage();
      case 6: // Calendar
        return const CalendarPage();
      case 7: // Library
        return const LibraryPage();
      case 8: // Message
        return const MessagePage();
      case 9: // Profile
        return const ProfilePage();
      case 10: // Settings
        return const SettingsPage();
      default:
        return const DashboardContent();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    
    return Scaffold(
      appBar: AppBar(
        title: !isDesktop ? const Text('SchoolHub') : null,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
          const CircleAvatar(
            backgroundImage: NetworkImage('https://randomuser.me/api/portraits/women/32.jpg'),
          ),
          const SizedBox(width: 10),
          if (isDesktop) 
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Linda Adams', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Administrator', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          const SizedBox(width: 20),
        ],
      ),
      drawer: !isDesktop ? Drawer(
        child: SidebarNavigation(
          selectedIndex: _selectedIndex,
          onItemSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
            Navigator.pop(context);
          },
        ),
      ) : null,
      body: Row(
        children: [
          // Sidebar Navigation for desktop
          if (isDesktop)
            SidebarNavigation(
              selectedIndex: _selectedIndex,
              onItemSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          // Main content area
          Expanded(
            child: Container(
              color: Colors.grey[50],
              padding: const EdgeInsets.all(16.0),
              child: _getPageContent(_selectedIndex),
            ),
          ),
        ],
      ),
    );
  }
}

class SidebarNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const SidebarNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.school, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 8),
                const Text(
                  'SchoolHub',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'MENU',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          _buildNavItem(0, Icons.dashboard_outlined, 'Dashboard'),
          _buildNavItem(1, Icons.people_outline, 'Teachers'),
          _buildNavItem(2, Icons.school_outlined, 'Students'),
          _buildNavItem(3, Icons.calendar_today_outlined, 'Attendance'),
          _buildNavItem(4, Icons.attach_money_outlined, 'Finance'),
          _buildNavItem(5, Icons.notifications_outlined, 'Notice'),
          _buildNavItem(6, Icons.event_outlined, 'Calendar'),
          _buildNavItem(7, Icons.local_library_outlined, 'Library'),
          _buildNavItem(8, Icons.message_outlined, 'Message'),
          const Spacer(),
          _buildNavItem(9, Icons.person_outline, 'Profile'),
          _buildNavItem(10, Icons.settings_outlined, 'Settings'),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.headset_mic, color: Colors.white, size: 20),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Help Center',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Get help with SchoolHub',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String title) {
    final isSelected = selectedIndex == index;
    
    return InkWell(
      onTap: () => onItemSelected(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : null,
          border: isSelected
              ? const Border(
                  left: BorderSide(
                    color: Colors.blue,
                    width: 3,
                  ),
                )
              : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.blue : Colors.grey,
              size: 20,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.blue : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
   }
}
              color: Colors.grey[50],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Top Bar
                    const TopBar(),
                    
                    const SizedBox(height: 20),
                    
                    // Main Content
                    Expanded(
                      child: _getPageContent(_selectedIndex),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ) : Container(
        color: Colors.grey[50],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Mobile Top Bar
              const MobileTopBar(),
              
              const SizedBox(height: 20),
              
              // Main Content
              Expanded(
                child: _getPageContent(_selectedIndex),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SidebarNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const SidebarNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.white,
      child: Column(
        children: [
          // Logo
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.school, color: Colors.blue[700]),
                const SizedBox(width: 8),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mount Glory',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'English Boarding High School',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 8),
          
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'MENU',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          
          // Menu Items
          _buildMenuItem(0, Icons.dashboard, 'Dashboard', isSelected: selectedIndex == 0),
          _buildMenuItem(1, Icons.person, 'Teachers', isSelected: selectedIndex == 1),
          _buildMenuItem(2, Icons.people, 'Students', isSelected: selectedIndex == 2),
          _buildMenuItem(3, Icons.calendar_today, 'Attendance', isSelected: selectedIndex == 3),
          _buildMenuItem(4, Icons.attach_money, 'Finance', isSelected: selectedIndex == 4),
          _buildMenuItem(5, Icons.notifications, 'Notice', isSelected: selectedIndex == 5),
          _buildMenuItem(6, Icons.event, 'Calendar', isSelected: selectedIndex == 6),
          _buildMenuItem(7, Icons.book, 'Library', isSelected: selectedIndex == 7),
          _buildMenuItem(8, Icons.message, 'Message', isSelected: selectedIndex == 8),
          
          const Spacer(),
          
          const Divider(),
          
          // Other Menu Items
          _buildMenuItem(9, Icons.person_outline, 'Profile', isSelected: selectedIndex == 9),
          _buildMenuItem(10, Icons.settings, 'Setting', isSelected: selectedIndex == 10),
          _buildMenuItem(11, Icons.logout, 'Log out', isSelected: selectedIndex == 11),
          
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildMenuItem(int index, IconData icon, String title, {bool isSelected = false}) {
    return InkWell(
      onTap: () => onItemSelected(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withValues(alpha: 0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? Colors.blue : Colors.grey[600],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: isSelected ? Colors.blue : Colors.grey[800],
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Search Bar
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
                Icon(Icons.search, color: Colors.grey[400], size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Search...',
                    style: TextStyle(color: Colors.grey[400], fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        
        const SizedBox(width: 16),
        
        // Notification Icon
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Stack(
            children: [
              const Icon(Icons.notifications_outlined, size: 20),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(width: 16),
        
        // User Profile
        Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage('https://randomuser.me/api/portraits/women/44.jpg'),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Linda Adora',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Mount Glory Admin',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class MobileTopBar extends StatelessWidget {
  const MobileTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Search Bar
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
                Icon(Icons.search, color: Colors.grey[400], size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Search...',
                    style: TextStyle(color: Colors.grey[400], fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        
        const SizedBox(width: 16),
        
        // Notification Icon
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Stack(
            children: [
              const Icon(Icons.notifications_outlined, size: 20),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StatsCardRow extends StatelessWidget {
  const StatsCardRow({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    
    if (isMobile) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: StatsCard(
                  title: 'Students',
                  value: '124,684',
                  increase: 10,
                  color: Colors.purple.shade100,
                  iconColor: Colors.purple.shade200,
                  icon: Icons.people,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: StatsCard(
                  title: 'Teachers',
                  value: '12,379',
                  increase: 3,
                  color: Colors.amber.shade100,
                  iconColor: Colors.amber.shade200,
                  icon: Icons.person,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: StatsCard(
                  title: 'Staffs',
                  value: '29,300',
                  increase: 3,
                  color: Colors.blue.shade100,
                  iconColor: Colors.blue.shade200,
                  icon: Icons.support_agent,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: StatsCard(
                  title: 'Awards',
                  value: '95,800',
                  increase: 6,
                  color: Colors.amber.shade100,
                  iconColor: Colors.amber.shade200,
                  icon: Icons.emoji_events,
                ),
              ),
            ],
          ),
        ],
      );
    }
    
    return Row(
      children: [
        Expanded(
          child: StatsCard(
            title: 'Students',
            value: '124,684',
            increase: 10,
            color: Colors.purple.shade100,
            iconColor: Colors.purple.shade200,
            icon: Icons.people,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: StatsCard(
            title: 'Teachers',
            value: '12,379',
            increase: 3,
            color: Colors.amber.shade100,
            iconColor: Colors.amber.shade200,
            icon: Icons.person,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: StatsCard(
            title: 'Staffs',
            value: '29,300',
            increase: 3,
            color: Colors.blue.shade100,
            iconColor: Colors.blue.shade200,
            icon: Icons.support_agent,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: StatsCard(
            title: 'Awards',
            value: '95,800',
            increase: 6,
            color: Colors.amber.shade100,
            iconColor: Colors.amber.shade200,
            icon: Icons.emoji_events,
          ),
        ),
      ],
    );
  }
}

class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final int increase;
  final Color color;
  final Color iconColor;
  final IconData icon;

  const StatsCard({
    super.key,
    required this.title,
    required this.value,
    required this.increase,
    required this.color,
    required this.iconColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 16),
              ),
              Row(
                children: [
                  const Icon(Icons.arrow_upward, color: Colors.green, size: 14),
                  Text(
                    '$increase%',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}

class StudentsSection extends StatelessWidget {
  const StudentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Students',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.more_horiz, color: Colors.grey[400]),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: const Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 180,
                    height: 180,
                    child: CustomPaint(
                      painter: GenderDistributionPainter(),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.male, color: Colors.blue, size: 20),
                          SizedBox(width: 4),
                          Icon(Icons.female, color: Colors.amber, size: 20),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildGenderStat('45,414', 'Boys (47%)', Colors.blue[200]!),
              _buildGenderStat('40,270', 'Girls (53%)', Colors.amber[200]!),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGenderStat(String value, String label, Color color) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

class GenderDistributionPainter extends CustomPainter {
  const GenderDistributionPainter();
  
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    
    // Boys arc (blue)
    final boysPaint = Paint()
      ..color = Colors.blue[200]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;
    
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 10),
      -0.5 * 3.14, // Start from left
      1.0 * 3.14,  // 180 degrees (half circle)
      false,
      boysPaint,
    );
    
    // Girls arc (yellow)
    final girlsPaint = Paint()
      ..color = Colors.amber[200]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;
    
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 10),
      0.5 * 3.14, // Start from right
      1.0 * 3.14, // 180 degrees (half circle)
      false,
      girlsPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class AttendanceSection extends StatelessWidget {
  const AttendanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Attendance',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'Weekly',
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(width: 4),
                        Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey[600]),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'Grade 3',
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(width: 4),
                        Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey[600]),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.more_horiz, color: Colors.grey[400]),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildAttendanceIndicator('Total Present', Colors.blue[200]!),
              const SizedBox(width: 16),
              _buildAttendanceIndicator('Total Absent', Colors.amber[200]!),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: const AttendanceBarChart(),
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceIndicator(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

class AttendanceBarChart extends StatelessWidget {
  const AttendanceBarChart({super.key});

  static const List<Map<String, dynamic>> weekData = [
    {'day': 'Mon', 'present': 70, 'absent': 30},
    {'day': 'Tue', 'present': 80, 'absent': 20},
    {'day': 'Wed', 'present': 95, 'absent': 5},
    {'day': 'Thu', 'present': 85, 'absent': 15},
    {'day': 'Fri', 'present': 75, 'absent': 25},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ...weekData.map((data) => _buildDayColumn(data)).toList(),
        ],
      ),
    );
  }

  Widget _buildDayColumn(Map<String, dynamic> data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            Container(
              width: 20,
              height: data['present'].toDouble() * 1.5,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 4),
            Container(
              width: 20,
              height: data['absent'].toDouble() * 1.5,
              decoration: BoxDecoration(
                color: Colors.amber[200],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (data['day'] == 'Wed')
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.amber[100],
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              '95%',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
          ),
        const SizedBox(height: 8),
        Text(
          data['day'],
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

class EarningsSection extends StatelessWidget {
  const EarningsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Earnings',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.blue[100]!),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.circle, size: 8, color: Colors.blue[400]),
                        const SizedBox(width: 4),
                        Text(
                          'Income',
                          style: TextStyle(fontSize: 12, color: Colors.blue[400]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.red[100]!),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.circle, size: 8, color: Colors.red[400]),
                        const SizedBox(width: 4),
                        Text(
                          'Expense',
                          style: TextStyle(fontSize: 12, color: Colors.red[400]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.more_horiz, color: Colors.grey[400]),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.attach_money, color: Colors.blue, size: 24),
                    Text(
                      '24,680',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CustomPaint(
                    size: const Size(double.infinity, 100),
                    painter: const EarningsChartPainter(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EarningsChartPainter extends CustomPainter {
  const EarningsChartPainter();
  
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    
    // Draw income line
    final incomePaint = Paint()
      ..color = Colors.blue[400]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    
    final incomePath = Path();
    incomePath.moveTo(0, height * 0.7);
    incomePath.lineTo(width * 0.2, height * 0.5);
    incomePath.lineTo(width * 0.4, height * 0.6);
    incomePath.lineTo(width * 0.6, height * 0.3);
    incomePath.lineTo(width * 0.8, height * 0.4);
    incomePath.lineTo(width, height * 0.2);
    
    canvas.drawPath(incomePath, incomePaint);
    
    // Draw expense line
    final expensePaint = Paint()
      ..color = Colors.red[400]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    
    final expensePath = Path();
    expensePath.moveTo(0, height * 0.5);
    expensePath.lineTo(width * 0.2, height * 0.6);
    expensePath.lineTo(width * 0.4, height * 0.4);
    expensePath.lineTo(width * 0.6, height * 0.7);
    expensePath.lineTo(width * 0.8, height * 0.5);
    expensePath.lineTo(width, height * 0.6);
    
    canvas.drawPath(expensePath, expensePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CalendarSection extends StatelessWidget {
  const CalendarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'September 2030',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Row(
                children: [
                  Icon(Icons.chevron_left, color: Colors.grey),
                  SizedBox(width: 16),
                  Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Sun', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('Mon', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('Tue', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('Wed', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('Thu', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('Fri', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('Sat', style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCalendarDay(''),
              _buildCalendarDay(''),
              _buildCalendarDay(''),
              _buildCalendarDay(''),
              _buildCalendarDay(''),
              _buildCalendarDay(''),
              _buildCalendarDay(''),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCalendarDay(''),
              _buildCalendarDay(''),
              _buildCalendarDay(''),
              _buildCalendarDay(''),
              _buildCalendarDay(''),
              _buildCalendarDay(''),
              _buildCalendarDay(''),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCalendarDay('19'),
              _buildCalendarDay('20'),
              _buildCalendarDay('21'),
              _buildCalendarDay('22', isSelected: true),
              _buildCalendarDay('23'),
              _buildCalendarDay('24'),
              _buildCalendarDay('25'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCalendarDay(''),
              _buildCalendarDay(''),
              _buildCalendarDay(''),
              _buildCalendarDay(''),
              _buildCalendarDay(''),
              _buildCalendarDay(''),
              _buildCalendarDay(''),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Agenda',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildAgendaItem(
                  '08:00 am',
                  'All Grade',
                  'Homeroom & Announcement',
                  Colors.indigo[100]!,
                ),
                const SizedBox(height: 12),
                _buildAgendaItem(
                  '10:00 am',
                  'Grade 1-4',
                  'Math Review & Practice',
                  Colors.blue[100]!,
                ),
                const SizedBox(height: 12),
                _buildAgendaItem(
                  '10:30 am',
                  'Grade 5-8',
                  'Science Experiment & Discussion',
                  Colors.green[100]!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarDay(String day, {bool isSelected = false}) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildAgendaItem(String time, String grade, String activity, Color color) {
    return Row(
      children: [
        SizedBox(
          width: 60,
          child: Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  grade,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  activity,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MessagesSection extends StatelessWidget {
  const MessagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Messages',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue[400],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.more_horiz, color: Colors.grey[400]),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildMessageItem(
                  'Dr. Lila Ramirez',
                  'Please check the monthly attendance reports for Grade 3 students.',
                  '4:00 PM',
                  'assets/avatar1.png',
                ),
                const SizedBox(height: 16),
                _buildMessageItem(
                  'Ms. Heather Morris',
                  'Don\'t forget the staff training on digital tools tomorrow at 3 PM.',
                  '10:15 AM',
                  'assets/avatar2.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(String name, String message, String time, String avatar) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey[200],
          child: const Icon(Icons.person, color: Colors.grey),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                message,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}