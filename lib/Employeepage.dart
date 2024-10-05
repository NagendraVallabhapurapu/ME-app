import 'package:employee_login/homepage.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart'; // Import TableCalendar

class EmployeeProfileAndProgressPage extends StatelessWidget {
  const EmployeeProfileAndProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final isMobile = screenWidth < 600;

    final double fontSizeHeader = isMobile ? 16 : 20;
    final double fontSizeTitle = isMobile ? 14 : 18;
    final double fontSizePieDetail = isMobile ? 12 : 16;
    final double profilePicSize = isMobile ? 30 : 50;
    final double paddingHorizontal = isMobile ? 8 : 16;
    final double cardPadding = isMobile ? 8 : 16;
    final double calendarHeight = isMobile
        ? screenHeight * 0.5
        : screenHeight * 0.6; // Adjust calendar height based on screen size
    final double barChartHeight = isMobile ? 20 : 25;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF732F14), Color(0xFFFAD02E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF8A1008),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('propic.png'),
                    radius: 30.0,
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(cardPadding),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: profilePicSize,
                              backgroundImage: const AssetImage('emp.png'),
                              backgroundColor: Colors.blueGrey[100],
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 4),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'MEMBER 1',
                                    style: TextStyle(
                                      fontSize: fontSizeHeader,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Employee ID: ME12345',
                                    style: TextStyle(
                                      fontSize: fontSizeTitle,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    'Designation: TELECALLER',
                                    style: TextStyle(
                                      fontSize: fontSizeTitle,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Profile Details',
                          style: TextStyle(
                            fontSize: fontSizeTitle,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 97, 30, 4),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('Department',
                                    style: TextStyle(fontSize: fontSizeTitle)),
                                subtitle: Text('Axis',
                                    style: TextStyle(fontSize: fontSizeTitle)),
                              ),
                              ListTile(
                                title: Text('Reporting Officer',
                                    style: TextStyle(fontSize: fontSizeTitle)),
                                subtitle: Text('Officer',
                                    style: TextStyle(fontSize: fontSizeTitle)),
                              ),
                              ListTile(
                                title: Text('Mobile Number',
                                    style: TextStyle(fontSize: fontSizeTitle)),
                                subtitle: Text('+91 98765432212',
                                    style: TextStyle(fontSize: fontSizeTitle)),
                              ),
                              ListTile(
                                title: Text('Mail Id',
                                    style: TextStyle(fontSize: fontSizeTitle)),
                                subtitle: Text('member1@gmail.com',
                                    style: TextStyle(fontSize: fontSizeTitle)),
                              ),
                              ListTile(
                                title: Text('Father’s Name',
                                    style: TextStyle(fontSize: fontSizeTitle)),
                                subtitle: Text('Father',
                                    style: TextStyle(fontSize: fontSizeTitle)),
                              ),
                              ListTile(
                                title: Text('Branch Name',
                                    style: TextStyle(fontSize: fontSizeTitle)),
                                subtitle: Text('Hyderabad',
                                    style: TextStyle(fontSize: fontSizeTitle)),
                              ),
                              ListTile(
                                title: Text('Work Location',
                                    style: TextStyle(fontSize: fontSizeTitle)),
                                subtitle: Text('Hyderabad',
                                    style: TextStyle(fontSize: fontSizeTitle)),
                              ),
                              ListTile(
                                title: Text(
                                  'Blood Group',
                                  style: TextStyle(fontSize: fontSizeTitle),
                                ),
                                subtitle: Text(
                                  'B-',
                                  style: TextStyle(fontSize: fontSizeTitle),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(cardPadding),
                        child: Column(
                          children: [
                            Text(
                              'Work Status',
                              style: TextStyle(
                                fontSize: fontSizeTitle,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 97, 30, 4),
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Pie Chart
                            // Inside the Column where you currently have the PieChart
                            SizedBox(
                              height: isMobile ? 150 : 200,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Doughnut (PieChart with inner radius)
                                  PieChart(
                                    PieChartData(
                                      sectionsSpace:
                                          4, // Space between sections for better visibility
                                      centerSpaceRadius: isMobile
                                          ? 40
                                          : 60, // Inner radius to create the doughnut effect
                                      sections: [
                                        PieChartSectionData(
                                          value: 90,
                                          color: const Color.fromARGB(
                                              255, 2, 88, 14),
                                          title: '90%',
                                          radius: isMobile ? 40 : 60,
                                          titleStyle: TextStyle(
                                            fontSize: fontSizePieDetail,
                                          ),
                                        ),
                                        PieChartSectionData(
                                          value: 40,
                                          color: const Color.fromARGB(
                                              255, 211, 235, 1),
                                          title: '40%',
                                          radius: isMobile ? 40 : 60,
                                          titleStyle: TextStyle(
                                            fontSize: fontSizePieDetail,
                                          ),
                                        ),
                                        PieChartSectionData(
                                          value: 25,
                                          color: const Color.fromARGB(
                                              255, 231, 19, 2),
                                          title: '25%',
                                          radius: isMobile ? 40 : 60,
                                          titleStyle: TextStyle(
                                            fontSize: fontSizePieDetail,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Center elevation decoration
                                  Container(
                                    height: isMobile
                                        ? 80
                                        : 120, // Adjust size for elevation effect
                                    width: isMobile ? 80 : 120,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Overall Progress',
                                        style: TextStyle(
                                          fontSize: isMobile ? 14 : 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 16),
                            // Bar Chart
                            Text(
                              'Overall Target Achieved',
                              style: TextStyle(
                                fontSize: fontSizeTitle,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 97, 30, 4),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Stack(
                              children: [
                                Container(
                                  height: barChartHeight,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                FractionallySizedBox(
                                  widthFactor: 0.6, // Example: 60% achieved
                                  child: Container(
                                    height: barChartHeight,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '60% Achieved',
                              style: TextStyle(
                                fontSize: fontSizeTitle,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Attendance',
                              style: TextStyle(
                                fontSize: fontSizeTitle,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 97, 30, 4),
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              height: calendarHeight,
                              width: isMobile
                                  ? screenWidth * 0.9
                                  : screenWidth * 0.7,
                              child: TableCalendar(
                                focusedDay: DateTime.now(),
                                firstDay: DateTime.utc(2020, 1, 1),
                                lastDay: DateTime.utc(2100, 12, 31),
                                calendarFormat: CalendarFormat.month,
                                startingDayOfWeek: StartingDayOfWeek.monday,
                                headerStyle: HeaderStyle(
                                  formatButtonVisible: false,
                                  titleCentered: true,
                                  titleTextStyle: TextStyle(
                                    fontSize: fontSizeTitle,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                daysOfWeekStyle: DaysOfWeekStyle(
                                  weekendStyle: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: fontSizeTitle,
                                  ),
                                ),
                                calendarStyle: CalendarStyle(
                                  weekendTextStyle: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: fontSizeTitle,
                                  ),
                                  todayDecoration: BoxDecoration(
                                    color: Colors.yellowAccent,
                                    shape: BoxShape.circle,
                                  ),
                                  selectedDecoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    shape: BoxShape.circle,
                                  ),
                                  markerDecoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    shape: BoxShape.circle,
                                  ),
                                  defaultTextStyle: TextStyle(
                                    fontSize: fontSizeTitle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
