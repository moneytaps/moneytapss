import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:matcher/matcher.dart';

import 'package:flutter/material.dart';

class UserHistory extends StatefulWidget {
  @override
  _UserHistoryPageState createState() => _UserHistoryPageState();
}

class _UserHistoryPageState extends State<UserHistory> {
  int _currentIndex = 0;

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
                        ? Color.fromARGB(255, 19, 104, 52)
                        : Colors.yellow,
                    child: Center(
                      child: Text(
                        'Current',
                        style: TextStyle(
                          color: Colors.white,
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
                        ? Color.fromARGB(255, 19, 104, 52)
                        : Colors.yellow,
                    child: Center(
                      child: Text(
                        'History',
                        style: TextStyle(
                          color: Colors.white,
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
    // TODO: Implement the history tab
    return Center(
      child: Text('History'),
    );
  }
}
