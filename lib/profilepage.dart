import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:employee_login/hierarchical.dart';
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
      'Designation': 'Manager',
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
            DrawerHeader(
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
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
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
            colors: [Color(0xFFFFFACD), Color(0xFFFFFFFF)],
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
                        : constraints.maxWidth * 0.9;
                    double logoWidth = constraints.maxWidth > 800
                        ? constraints.maxWidth * 0.1
                        : 40.0;
                    double spacing = constraints.maxWidth * 0.05;
                    double fontSize = isMobile ? 14.0 : 16.0;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: isMobile ? 2 : 1,
                              child: Container(
                                padding: EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                      color: reddishBrown, width: 2.0),
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
                                      width: isMobile ? 80.0 : 100.0,
                                      height: isMobile ? 80.0 : 100.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        image: DecorationImage(
                                          image: AssetImage('propic.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            profileData['Name']!,
                                            style: TextStyle(
                                              fontSize: isMobile ? 18.0 : 22.0,
                                              fontWeight: FontWeight.bold,
                                              color: reddishBrown,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(height: 4.0),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      HierarchicalPage(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              profileData['Designation']!,
                                              style: TextStyle(
                                                fontSize:
                                                    isMobile ? 14.0 : 16.0,
                                                color: Colors.grey[600],
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.edit_document,
                                          color: reddishBrown),
                                      onPressed: () {
                                        _showEditDialog(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (!isMobile) SizedBox(width: spacing),
                            if (!isMobile)
                              Container(
                                width: logoWidth,
                                child: Image.asset(
                                  'logo.png',
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              bool isDesktop = constraints.maxWidth > 800;
                              return isDesktop
                                  ? GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 16.0,
                                        mainAxisSpacing: 16.0,
                                        childAspectRatio: 4,
                                      ),
                                      itemCount: profileData.length,
                                      itemBuilder: (context, index) {
                                        String key =
                                            profileData.keys.elementAt(index);
                                        String value =
                                            profileData.values.elementAt(index);
                                        IconData icon =
                                            detailIcons[key] ?? Icons.info;
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
                                              SizedBox(width: 12.0),
                                              Text(
                                                '$key: ',
                                                style: TextStyle(
                                                  fontSize: fontSize,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                    fontSize: fontSize,
                                                    color: Colors.grey[600],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    )
                                  : ListView.builder(
                                      itemCount: profileData.length,
                                      itemBuilder: (context, index) {
                                        String key =
                                            profileData.keys.elementAt(index);
                                        String value =
                                            profileData.values.elementAt(index);
                                        IconData icon =
                                            detailIcons[key] ?? Icons.info;
                                        return Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 16.0),
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
                                              SizedBox(width: 12.0),
                                              Text(
                                                '$key: ',
                                                style: TextStyle(
                                                  fontSize: fontSize,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                    fontSize: fontSize,
                                                    color: Colors.grey[600],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
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

  void _showEditDialog(BuildContext context) async {
    File? newProfileImage;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        final isMobile = MediaQuery.of(context).size.width < 600;
        final avatarRadius = isMobile ? 50.0 : 60.0; // Adjusted radius

        return AlertDialog(
          title: Text('Edit Profile'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Edit profile picture:'),
                SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(type: FileType.image);

                    if (result != null) {
                      newProfileImage = File(result.files.single.path!);
                    }
                  },
                  child: CircleAvatar(
                    radius: avatarRadius, // Use the dynamic radius
                    backgroundColor: Colors.grey[300],
                    backgroundImage: newProfileImage != null
                        ? FileImage(newProfileImage!)
                        : AssetImage(
                            'propic.png',
                          ) as ImageProvider,
                    child: Align(
                      alignment: Alignment.center,
                      child:
                          Icon(Icons.camera_alt_rounded, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 12.0),
                TextFormField(
                  initialValue: 'user@gmail.com',
                  decoration: InputDecoration(
                    labelText: 'Email ID',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12.0),
                TextFormField(
                  initialValue: '+1234567890',
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                // Save the edited data
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
