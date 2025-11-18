import 'package:flutter/material.dart';
import 'widgets.dart';

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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'All Teachers List',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search by Name, ID or Subject',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.refresh, color: Colors.amber),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_list, color: Colors.amber),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.amber),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 40),
                      Expanded(
                        flex: 2,
                        child: Text('Teacher Name', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Expanded(
                        child: Text('School ID', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Expanded(
                        child: Text('Subject', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Expanded(
                        child: Text('Class(es)', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Expanded(
                        child: Text('Phone Number', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Expanded(
                        child: Text('Address', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Expanded(
                        child: Text('Action', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: teachersList.length,
                  itemBuilder: (context, index) {
                    final teacher = teachersList[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade200),
                        ),
                        color: index == 1 ? Colors.blue.withValues(alpha: 0.1) : null,
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: index == 1,
                            onChanged: (value) {},
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey.shade200,
                                  child: Text(teacher.name.substring(0, 1)),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(teacher.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                                    Text(teacher.email, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(teacher.schoolId),
                          ),
                          Expanded(
                            child: Text(teacher.subject),
                          ),
                          Expanded(
                            child: Text(teacher.classes),
                          ),
                          Expanded(
                            child: Text(teacher.phone),
                          ),
                          Expanded(
                            child: Text(teacher.address),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.visibility_outlined, size: 20),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.edit_outlined, size: 20),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline, size: 20),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Teacher {
  final String name;
  final String email;
  final String schoolId;
  final String subject;
  final String classes;
  final String phone;
  final String address;

  Teacher({
    required this.name,
    required this.email,
    required this.schoolId,
    required this.subject,
    required this.classes,
    required this.phone,
    required this.address,
  });
}

final List<Teacher> teachersList = [
  Teacher(
    name: 'Ms. Elizabeth Johnson',
    email: 'elizabeth@schoolhub.edu',
    schoolId: 'ENG-123',
    subject: 'English Literature',
    classes: '9A, 10B',
    phone: '(555) 101-0101',
    address: '123 Elm St, Springfield, IL',
  ),
  Teacher(
    name: 'Mr. Carlos Garcia',
    email: 'carlos@schoolhub.edu',
    schoolId: 'HIS-456',
    subject: 'History',
    classes: '8C, 11A',
    phone: '(555) 101-0102',
    address: '456 Oak Ave, Springfield, IL',
  ),
  Teacher(
    name: 'Ms. Angela Jackson',
    email: 'angela@schoolhub.edu',
    schoolId: 'MAT-789',
    subject: 'Math Calculus',
    classes: '7A, 12 AP',
    phone: '(555) 101-0103',
    address: '789 Pine St, Springfield, IL',
  ),
  Teacher(
    name: 'Mr. Luis Rodrigo',
    email: 'luis@schoolhub.edu',
    schoolId: 'DRA-012',
    subject: 'Drama',
    classes: 'Drama Club',
    phone: '(555) 101-0104',
    address: '101 Maple Dr, Springfield, IL',
  ),
  Teacher(
    name: 'Ms. Susan Chen',
    email: 'susan@schoolhub.edu',
    schoolId: 'SCI-345',
    subject: 'Science',
    classes: '8B, 9B Biology',
    phone: '(555) 101-0105',
    address: '345 Birch Ln, Springfield, IL',
  ),
  Teacher(
    name: 'Mr. William Blake',
    email: 'william@schoolhub.edu',
    schoolId: 'HIS-678',
    subject: 'History',
    classes: '10A, 11 AP World History',
    phone: '(555) 101-0106',
    address: '678 Cedar Blvd, Springfield, IL',
  ),
  Teacher(
    name: 'Ms. Emily Lee',
    email: 'emily@schoolhub.edu',
    schoolId: 'ENG-901',
    subject: 'English',
    classes: '7B, 8A',
    phone: '(555) 101-0107',
    address: '901 Walnut St, Springfield, IL',
  ),
  Teacher(
    name: 'Mr. Fernando Davis',
    email: 'fernando@schoolhub.edu',
    schoolId: 'SPA-234',
    subject: 'Spanish',
    classes: 'Spanish I, Spanish II',
    phone: '(555) 101-0108',
    address: '234 Spruce Way, Springfield, IL',
  ),
  Teacher(
    name: 'Ms. Laura Lopez',
    email: 'laura@schoolhub.edu',
    schoolId: 'MAT-567',
    subject: 'Math',
    classes: '9C, Pre-Algebra',
    phone: '(555) 101-0109',
    address: '567 Redwood Ct, Springfield, IL',
  ),
];

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'All Students List',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search by Name, ID or Class',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.refresh, color: Colors.amber),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_list, color: Colors.amber),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.amber),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 40),
                      Expanded(
                        flex: 2,
                        child: Text('Student Name', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Expanded(
                        child: Text('Student ID', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Expanded(
                        child: Text('Class', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Expanded(
                        child: Text('Parent Name', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Expanded(
                        child: Text('Phone Number', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Expanded(
                        child: Text('Address', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Expanded(
                        child: Text('Action', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: studentsList.length,
                  itemBuilder: (context, index) {
                    final student = studentsList[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade200),
                        ),
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey.shade200,
                                  child: Text(student.name.substring(0, 1)),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(student.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                                    Text(student.email, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(student.studentId),
                          ),
                          Expanded(
                            child: Text(student.className),
                          ),
                          Expanded(
                            child: Text(student.parentName),
                          ),
                          Expanded(
                            child: Text(student.phone),
                          ),
                          Expanded(
                            child: Text(student.address),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.visibility_outlined, size: 20),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.edit_outlined, size: 20),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline, size: 20),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Student {
  final String name;
  final String email;
  final String studentId;
  final String className;
  final String parentName;
  final String phone;
  final String address;

  Student({
    required this.name,
    required this.email,
    required this.studentId,
    required this.className,
    required this.parentName,
    required this.phone,
    required this.address,
  });
}

final List<Student> studentsList = [
  Student(
    name: 'John Smith',
    email: 'john.smith@student.edu',
    studentId: 'STU-1001',
    className: '9A',
    parentName: 'Robert Smith',
    phone: '(555) 123-4567',
    address: '123 Main St, Springfield, IL',
  ),
  Student(
    name: 'Emily Johnson',
    email: 'emily.johnson@student.edu',
    studentId: 'STU-1002',
    className: '10B',
    parentName: 'Sarah Johnson',
    phone: '(555) 234-5678',
    address: '456 Oak Ave, Springfield, IL',
  ),
  Student(
    name: 'Michael Brown',
    email: 'michael.brown@student.edu',
    studentId: 'STU-1003',
    className: '8C',
    parentName: 'David Brown',
    phone: '(555) 345-6789',
    address: '789 Pine St, Springfield, IL',
  ),
  Student(
    name: 'Sophia Garcia',
    email: 'sophia.garcia@student.edu',
    studentId: 'STU-1004',
    className: '11A',
    parentName: 'Maria Garcia',
    phone: '(555) 456-7890',
    address: '101 Maple Dr, Springfield, IL',
  ),
  Student(
    name: 'Daniel Wilson',
    email: 'daniel.wilson@student.edu',
    studentId: 'STU-1005',
    className: '7B',
    parentName: 'Thomas Wilson',
    phone: '(555) 567-8901',
    address: '202 Elm St, Springfield, IL',
  ),
  Student(
    name: 'Olivia Martinez',
    email: 'olivia.martinez@student.edu',
    studentId: 'STU-1006',
    className: '12A',
    parentName: 'Carlos Martinez',
    phone: '(555) 678-9012',
    address: '303 Cedar Rd, Springfield, IL',
  ),
  Student(
    name: 'James Taylor',
    email: 'james.taylor@student.edu',
    studentId: 'STU-1007',
    className: '9B',
    parentName: 'Jennifer Taylor',
    phone: '(555) 789-0123',
    address: '404 Birch Ln, Springfield, IL',
  ),
];

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