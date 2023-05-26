import 'package:flutter/material.dart';

class UserHistory extends StatefulWidget {
  @override
  _UserHistoryPageState createState() => _UserHistoryPageState();
}

class _UserHistoryPageState extends State<UserHistory> {
  int _currentIndex = 0;

  List<Map<String, dynamic>> tableData = [
    {'payment': 1, 'principal': 100, 'interest': 10, 'balance': 900},
    {'payment': 2, 'principal': 150, 'interest': 15, 'balance': 750},
    {'payment': 3, 'principal': 200, 'interest': 20, 'balance': 550},
    {'payment': 4, 'principal': 500, 'interest': 50, 'balance': 670},
    {'payment': 5, 'principal': 450, 'interest': 70, 'balance': 530},
    {'payment': 6, 'principal': 600, 'interest': 80, 'balance': 470},
    {'payment': 7, 'principal': 650, 'interest': 50, 'balance': 500},
    {'payment': 8, 'principal': 700, 'interest': 60, 'balance': 600},
    // Add more rows as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 19, 104, 52),
        title: Text('Bill'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                  child: Container(
                    height: 50,
                    color: _currentIndex == 0
                        ? Colors.yellow
                        : Color.fromARGB(255, 19, 104, 52),
                    child: Center(
                      child: Text(
                        'Current',
                        style: TextStyle(
                          color:
                              _currentIndex == 0 ? Colors.black : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                  child: Container(
                    height: 50,
                    color: _currentIndex == 1
                        ? Colors.yellow
                        : Color.fromARGB(255, 19, 104, 52),
                    child: Center(
                      child: Text(
                        'History',
                        style: TextStyle(
                          color:
                              _currentIndex == 1 ? Colors.black : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: _currentIndex == 0 ? _buildCurrent() : _buildHistory(),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrent() {
    // TODO: Implement the current tab
    return Center(
      child: Text('Current'),
    );
  }

  Widget _buildHistory() {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Payment')),
                  DataColumn(label: Text('Principal')),
                  DataColumn(label: Text('Interest')),
                  DataColumn(label: Text('Balance')),
                ],
                rows: tableData.map((data) {
                  return DataRow(cells: [
                    DataCell(Text(data['payment'].toString())),
                    DataCell(Text(data['principal'].toString())),
                    DataCell(Text(data['interest'].toString())),
                    DataCell(Text(data['balance'].toString())),
                  ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
