import 'package:flutter/material.dart';

import '../login_page.dart';



class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADMIN DASHBOARD'),
        backgroundColor: Color.fromARGB(255, 19, 104, 52),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirmation'),
                    content: Text('Are you sure you want to log out?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text('Yes'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text('No'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
        leading: IconButton(
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            icon: Icon(Icons.menu)),
      ),
      body: Row(
        children: [
          NavigationRail(
              extended: isExpanded,
              backgroundColor: Color.fromARGB(255, 19, 104, 52),
              unselectedIconTheme:
                  IconThemeData(color: Colors.yellow, opacity: 1),
              unselectedLabelTextStyle: TextStyle(color: Colors.yellow),
              selectedLabelTextStyle: TextStyle(color: Colors.white),
              selectedIconTheme: IconThemeData(
                color: Color.fromARGB(255, 5, 28, 14),
              ),
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bar_chart),
                  label: Text('Reports'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text('Profile'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text('Settings'),
                ),
              ],
              selectedIndex: 0),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(60),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.article,
                                      size: 26.0,
                                    ),
                                    SizedBox(width: 15.0),
                                    Text(
                                      'Pending',
                                      style: TextStyle(
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  '6 Pendings',
                                  style: TextStyle(
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.comment,
                                      size: 26.0,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 15.0),
                                    Text(
                                      'Approved',
                                      style: TextStyle(
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  '+ 32 Approved',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.people,
                                      size: 26.0,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 15.0),
                                    Text(
                                      'Users',
                                      style: TextStyle(
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  '2.2k Users',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.monetization_on_outlined,
                                      size: 26.0,
                                      color: Colors.green,
                                    ),
                                    SizedBox(width: 15.0),
                                    Text(
                                      'Revenue',
                                      style: TextStyle(
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  '1.1M',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            '6 Pendings',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            '3 new Pendings',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 150.0,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'type the Id ',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.deepPurple.shade400,
                        ),
                        label: Text(
                          "2023, may 9",
                          style: TextStyle(color: Colors.deepPurple.shade400),
                        ),
                      ),
                      Row(
                        children: [
                          DropdownButton(
                              hint: Text('Filter By'),
                              items: [
                                DropdownMenuItem(
                                  value: "Date",
                                  child: Text('Date'),
                                ),
                                DropdownMenuItem(
                                  value: "Comments",
                                  child: Text('Comments'),
                                ),
                                DropdownMenuItem(
                                  value: 'View',
                                  child: Text('View'),
                                ),
                              ],
                              onChanged: (value) {}),
                          SizedBox(
                            width: 10,
                          ),
                          DropdownButton(
                              hint: Text('Order By'),
                              items: [
                                DropdownMenuItem(
                                  value: "Date",
                                  child: Text('Date'),
                                ),
                                DropdownMenuItem(
                                  value: "Comments",
                                  child: Text('Comments'),
                                ),
                                DropdownMenuItem(
                                  value: 'View',
                                  child: Text('View'),
                                ),
                              ],
                              onChanged: (value) {}),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40.0),
                  Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DataTable(
                          headingRowColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.green),
                          columns: [
                            DataColumn(label: Text('ID')),
                            DataColumn(label: Text('NAME')),
                            DataColumn(label: Text('LOAN AMOUNT')),
                            DataColumn(label: Text('lOAN DAYS')),
                            DataColumn(label: Text('INTEREST')),
                            DataColumn(label: Text('TOTAL REPAYMENT')),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(Text('1')),
                              DataCell(Text('jeriz aguilar')),
                              DataCell(Text("20,000")),
                              DataCell(Text('60 DAYS')),
                              DataCell(Text('720')),
                              DataCell(Text('20,720')),
                            ]),
                          ])
                    ],
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
