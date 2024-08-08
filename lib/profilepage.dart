import 'package:flutter/material.dart';
import 'package:employee_login/homepage.dart';
import 'package:employee_login/loginpage.dart';

class ProfilePage extends StatelessWidget {
  Future<Map<String, String>> _loadProfileData() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate a network delay
    return {
      'Name': 'User Name',
      'Employee ID': 'ME123456',
      'Email': 'user@gmail.com',
      'Phone': '+1234567890',
      'Designation': 'Team Leader',
      'Department': 'AXIS',
      'Reporting Officer': 'Officer',
      'Date of Joining': '2024-01-01',
      'Father\'s Name': 'Father',
      'Branch Name': 'Hyderabad',
      'Work Location': 'Hyderabad',
      'Employee Portfolio': 'AXIS BKIT',
      'Bank ID Card': 'BANK123456789',
      'Blood Group': 'O+',
    };
  }

  final Map<String, IconData> detailIcons = {
    'Name': Icons.person,
    'Employee ID': Icons.badge,
    'Email': Icons.email,
    'Phone': Icons.phone,
    'Designation': Icons.work,
    'Department': Icons.group,
    'Reporting Officer': Icons.supervisor_account,
    'Date of Joining': Icons.calendar_today,
    'Father\'s Name': Icons.family_restroom,
    'Branch Name': Icons.location_city,
    'Work Location': Icons.location_on,
    'Employee Portfolio': Icons.folder,
    'Bank ID Card': Icons.credit_card,
    'Blood Group': Icons.health_and_safety,
  };

  final Color reddishBrown = Color(0xFF8A1008);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
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
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Profile',
            style: TextStyle(
              color: reddishBrown,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            // Profile section
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF8A1008), // Ensure this color is correct
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('propic.png'), // Ensure this asset exists
                    radius: 30.0,
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    'User Name', // Replace with actual user name
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // List of menu items
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                ); // Ensure route is defined
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                ); // Ensure route is defined
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFACD), // Light Yellow
              Color(0xFFFFFFFF) // White
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder<Map<String, String>>(
          future: _loadProfileData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8A1008)),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading profile data'));
            } else {
              final profileData = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double headerWidth = constraints.maxWidth > 800
                        ? constraints.maxWidth * 0.6
                        : constraints.maxWidth * 0.8;
                    double logoWidth = constraints.maxWidth > 800
                        ? constraints.maxWidth * 0.1
                        : 50.0;
                    double spacing = constraints.maxWidth * 0.05;
                    double fontSize =
                        isMobile ? 14.0 : 16.0; // Adjust font size

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: headerWidth,
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                border:
                                    Border.all(color: reddishBrown, width: 2.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: AssetImage('propic.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    width: 100.0,
                                    height: 100.0,
                                  ),
                                  SizedBox(width: 16.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          profileData['Name']!,
                                          style: TextStyle(
                                            fontSize: isMobile ? 20.0 : 24.0,
                                            fontWeight: FontWeight.bold,
                                            color: reddishBrown,
                                          ),
                                        ),
                                        SizedBox(height: 8.0),
                                        Text(
                                          profileData['Designation']!,
                                          style: TextStyle(
                                            fontSize: isMobile ? 16.0 : 18.0,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.edit_document,
                                        color: reddishBrown),
                                    onPressed: () {
                                      // Implement edit profile functionality
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: spacing),
                            Container(
                              width: logoWidth,
                              child: Image.asset(
                                'logo.png',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              bool isDesktop = constraints.maxWidth > 800;
                              return isDesktop
                                  ? GridView(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 16.0,
                                        mainAxisSpacing: 16.0,
                                        childAspectRatio: 4,
                                      ),
                                      children:
                                          profileData.entries.map((entry) {
                                        IconData icon =
                                            detailIcons[entry.key] ??
                                                Icons.info;
                                        return Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 16.0),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(icon, color: reddishBrown),
                                              SizedBox(width: 8.0),
                                              Expanded(
                                                child: Text(
                                                  entry.key,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: fontSize,
                                                    color: reddishBrown,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 8.0),
                                              Expanded(
                                                child: Text(
                                                  entry.value,
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    fontSize: fontSize,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    )
                                  : ListView(
                                      children:
                                          profileData.entries.map((entry) {
                                        IconData icon =
                                            detailIcons[entry.key] ??
                                                Icons.info;
                                        return ListTile(
                                          leading:
                                              Icon(icon, color: reddishBrown),
                                          title: Text(
                                            entry.key,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: fontSize,
                                              color: reddishBrown,
                                            ),
                                          ),
                                          trailing: Text(
                                            entry.value,
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontSize: fontSize,
                                              color: Colors.black,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
