import 'package:flutter/material.dart';
import 'package:moneytap/pages/admin/api_service.dart';

import '../../../model/usermodel.dart';

class FindClient extends StatefulWidget {
  const FindClient({super.key});

  @override
  State<FindClient> createState() => _FindClientState();
}

var data;
FetchUser _userList = FetchUser();

class _FindClientState extends State<FindClient> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('jeriz')),
        body: Container(
          child: FutureBuilder<List<Userlist>>(
              future: _userList.getUserList(),
              builder: (context, snapshot) {
                data = snapshot.data;
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  '${data?[index].id}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              children: [
                                Text(
                                  '${data?[index].email}',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text('${data?[index].contact}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}