import 'package:flutter/material.dart';

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
              Expanded(child: StatsCard(title: 'Students', value: '124,684', increase: 10, color: Colors.purple.shade100, iconColor: Colors.purple.shade200, icon: Icons.people)),
              const SizedBox(width: 16),
              Expanded(child: StatsCard(title: 'Teachers', value: '12,379', increase: 3, color: Colors.amber.shade100, iconColor: Colors.amber.shade200, icon: Icons.person)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: StatsCard(title: 'Staffs', value: '29,300', increase: 3, color: Colors.blue.shade100, iconColor: Colors.blue.shade200, icon: Icons.support_agent)),
              const SizedBox(width: 16),
              Expanded(child: StatsCard(title: 'Awards', value: '95,800', increase: 6, color: Colors.amber.shade100, iconColor: Colors.amber.shade200, icon: Icons.emoji_events)),
            ],
          ),
        ],
      );
    }
    
    return Row(
      children: [
        Expanded(child: StatsCard(title: 'Students', value: '124,684', increase: 10, color: Colors.purple.shade100, iconColor: Colors.purple.shade200, icon: Icons.people)),
        const SizedBox(width: 16),
        Expanded(child: StatsCard(title: 'Teachers', value: '12,379', increase: 3, color: Colors.amber.shade100, iconColor: Colors.amber.shade200, icon: Icons.person)),
        const SizedBox(width: 16),
        Expanded(child: StatsCard(title: 'Staffs', value: '29,300', increase: 3, color: Colors.blue.shade100, iconColor: Colors.blue.shade200, icon: Icons.support_agent)),
        const SizedBox(width: 16),
        Expanded(child: StatsCard(title: 'Awards', value: '95,800', increase: 6, color: Colors.amber.shade100, iconColor: Colors.amber.shade200, icon: Icons.emoji_events)),
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
                  Text('$increase%', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
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
      child: const Center(
        child: Text('Students Section - Coming Soon', style: TextStyle(fontSize: 16)),
      ),
    );
  }
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
      child: const Center(
        child: Text('Attendance Section - Coming Soon', style: TextStyle(fontSize: 16)),
      ),
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
      child: const Center(
        child: Text('Earnings Section - Coming Soon', style: TextStyle(fontSize: 16)),
      ),
    );
  }
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
      child: const Center(
        child: Text('Calendar Section - Coming Soon', style: TextStyle(fontSize: 16)),
      ),
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
      child: const Center(
        child: Text('Messages Section - Coming Soon', style: TextStyle(fontSize: 16)),
      ),
    );
  }
}