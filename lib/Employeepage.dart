import 'package:flutter/material.dart';

class EmployeeProfileAndProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Profile & Work Progress'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isWide = constraints.maxWidth > 600;
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Header
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/profile_picture.png'),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'John Doe',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text('Employee ID: 12345'),
                              Text('Designation: Software Engineer'),
                              Text('Department: Development'),
                              Text('Email: john.doe@example.com'),
                            ],
                          ),
                        ),
                        if (isWide) SizedBox(width: 16),
                        if (isWide)
                          ElevatedButton(
                            onPressed: () {
                              // Edit Profile Action
                            },
                            child: Text('Edit Profile'),
                          ),
                      ],
                    ),
                  ),
                  // Profile Details
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Profile Details',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Father’s Name'),
                          subtitle: Text('John Doe Sr.'),
                        ),
                        ListTile(
                          title: Text('Branch Name'),
                          subtitle: Text('Headquarters'),
                        ),
                        ListTile(
                          title: Text('Work Location'),
                          subtitle: Text('Remote'),
                        ),
                        // Add more details as needed
                      ],
                    ),
                  ),
                  // Work Progress Header
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Work Progress Overview',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Work Progress Section
                  Container(
                    child: Column(
                      children: [
                        Card(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            title: Text('Task 1'),
                            subtitle: Text('Completed'),
                            trailing: Text('80%'),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            title: Text('Task 2'),
                            subtitle: Text('In Progress'),
                            trailing: Text('50%'),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            title: Text('Task 3'),
                            subtitle: Text('Not Started'),
                            trailing: Text('0%'),
                          ),
                        ),
                        // Add more progress tasks as needed
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
