import 'package:flutter/material.dart';
import 'main.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    
    return Column(
      children: [
        const StatsCardRow(),
        const SizedBox(height: 20),
        Expanded(
          child: isMobile ? const SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  child: StudentsSection(),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: AttendanceSection(),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: EarningsSection(),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 400,
                  child: CalendarSection(),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: MessagesSection(),
                ),
              ],
            ),
          ) : const Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(child: StudentsSection()),
                    SizedBox(height: 16),
                    Expanded(child: AttendanceSection()),
                  ],
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    Expanded(child: EarningsSection()),
                    SizedBox(height: 16),
                    Expanded(child: CalendarSection()),
                    SizedBox(height: 16),
                    Expanded(child: MessagesSection()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TeachersPage extends StatelessWidget {
  const TeachersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Teachers Page - Coming Soon'),
    );
  }
}

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Students Page - Coming Soon'),
    );
  }
}

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Attendance Page - Coming Soon'),
    );
  }
}

class FinancePage extends StatelessWidget {
  const FinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Finance Page - Coming Soon'),
    );
  }
}

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Notice Page - Coming Soon'),
    );
  }
}