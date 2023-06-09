import 'dart:convert';

import 'package:flutter/material.dart';
import '../login_page.dart';
import 'package:http/http.dart' as http;

import 'api_service.dart';



class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  bool isExpanded = false;
  FetchClient2 fetchClient = FetchClient2();
  List<DataRow> fetchData = [];

  void data()async{
    http.Response response = await fetchClient.getClientList();
    print(jsonDecode(response.body));
    // for(var i in jsonDecode(response.body)){
    //   fetchData.add(DataRow(cells:[
    //     DataCell(Text(i['status'])),
    //     DataCell(Text(i['contact'])),
    //     DataCell(Text(i['first_name'])),
    //     DataCell(Text(i['middle_name'])),
    //     DataCell(Text(i['sur_name'])),
    //     DataCell(Text(i['birth'])),
    //     DataCell(Text(i['gender'])),
    //     DataCell(Text(i['address'])),
    //     DataCell(Text(i['primary'])),
    //     DataCell(Text(i['loan_amount'])),
    //     DataCell(Text(i['days'])),
    //     DataCell(Text(i['interest'])),
    //     DataCell(Text(i['total_amount'])),
    //   ]));
    // }

  }

  @override
  void initState(){
    super.initState();
    data();
  }
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
                        ],
                      ),
                      SizedBox(height: 40.0),
                      Row(
                        children: [
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          DataTable(
                              headingRowColor: MaterialStateProperty.resolveWith(
                                      (states) => Colors.green),
                              columns: [
                                DataColumn(label: Text('ID')),
                                DataColumn(label: Text('STATUS')),
                                DataColumn(label: Text('CONTACT')),
                                DataColumn(label: Text('NAME')),
                                DataColumn(label: Text('LOAN AMOUNT')),
                                DataColumn(label: Text('LOAN DAYS')),
                                DataColumn(label: Text('INTEREST')),
                                DataColumn(label: Text('TOTAL REPAYMENT')),
                              ],
                              rows:
                                fetchData
                              )
                        ],
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}