import 'package:flutter/material.dart';

import '../model/account.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({super.key});

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 218, 241),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Account Information")
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15,100,15,15),
              child: CircleAvatar(
                radius: 120,
                backgroundImage: AssetImage('images/raichu.jpeg'),
              ),
            ),
            Text(
              Account.id,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(height: 2, color: Colors.blue),
            ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Row(
                children: [
                  Text(
                    "Email: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ), 
                  Text(
                    Account.email,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  )
                ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Row(
                children: [
                  Text(
                    "Birth: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ), 
                  Text(
                    Account.birth,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  )
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
