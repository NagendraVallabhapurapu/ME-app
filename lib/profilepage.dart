import 'package:employee_login/loginpage.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  // Simulate a Future for loading profile data
  Future<Map<String, String>> _loadProfileData() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate a network delay
    return {
      'name': 'User Name',
      'email': 'user@gmail.com',
      'phone': '+1234567890',
      'employeeId': '123456',
      'designation': 'Team Leader',
      'department': 'Personal Loans',
      'reportingOfficer': 'Officer',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF732F14), Color(0xFFFAD02E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(
              builder: (BuildContext context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Center(
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      color: Color.fromARGB(255, 99, 31, 6),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 138, 16, 8),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        'propic.png'), // Replace with actual profile image asset
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
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
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
      body: FutureBuilder<Map<String, String>>(
        future: _loadProfileData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 138, 16, 8)),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading profile data'));
          } else {
            final profileData = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            'propic.png'), // Replace with actual profile image asset
                        radius: 50.0,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        profileData['name']!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      buildProfileDetail('Email', profileData['email']!),
                      buildProfileDetail('Phone', profileData['phone']!),
                      buildProfileDetail(
                          'Employee ID', profileData['employeeId']!),
                      buildProfileDetail(
                          'Designation', profileData['designation']!),
                      buildProfileDetail(
                          'Department', profileData['department']!),
                      buildProfileDetail('Reporting Officer',
                          profileData['reportingOfficer']!),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget buildProfileDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$title: ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
