import 'package:employee_login/loginpage.dart';
import 'package:flutter/material.dart';

// Define the LoginPage widget
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Text('Login Page Content'),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
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
                  // Open the drawer when the menu button is pressed
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            actions: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Image.asset(
                  'logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            // Profile section
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 138, 16, 8),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        'profile_image.png'), // Replace with actual profile image asset
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
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                // Handle profile tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle settings tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Handle logout and navigate to LoginPage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          int columns = width > 600 ? 2 : 1;
          double childAspectRatio =
              width > 600 ? 3 : 2.5; // Adjust aspect ratio for mobile

          return GridView.builder(
            padding: EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: childAspectRatio,
            ),
            itemCount: _cards.length,
            itemBuilder: (context, index) {
              return _buildCard(
                _cards[index]['title'],
                _cards[index]['content'],
                _cards[index]['icon'],
              );
            },
          );
        },
      ),
    );
  }

  List<Map<String, dynamic>> get _cards => [
        {
          'title': 'Appointments',
          'content': 'List of appointments of the user previously.',
          'icon': Icons.person,
        },
        {
          'title': 'Monthly Allocation',
          'content': 'List of monthly active and inactive leads.',
          'icon': Icons.calendar_month,
        },
        {
          'title': 'Pickup Allocations',
          'content': 'List of pickup allocation.',
          'icon': Icons.run_circle,
        },
        {
          'title': 'Account Status',
          'content': 'Detailed description about the account.',
          'icon': Icons.document_scanner_sharp,
        },
        {
          'title': 'Collector Dashboard',
          'content': 'Current status and performance of the collector.',
          'icon': Icons.bar_chart,
        },
      ];

  Widget _buildCard(String title, String content, IconData icon) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 40.0,
                  color: const Color.fromARGB(
                      255, 99, 31, 6), // Change icon color to brown
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(
                          255, 99, 31, 6), // Change text color to brown
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(
                    255, 99, 31, 6), // Change text color to brown
              ),
            ),
          ],
        ),
      ),
    );
  }
}
