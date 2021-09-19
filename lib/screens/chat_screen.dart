import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actionsIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          "Ghost",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          DropdownButton(
            underline: Container(),
            icon: const Icon(Icons.more_vert_outlined),
            items: [
              DropdownMenuItem(
                value: "logout",
                child: Row(
                  children: const [
                    Icon(Icons.exit_to_app),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Logout")
                  ],
                ),
              ),
            ],
            onChanged: (itemBuilder) {
              if (itemBuilder == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final reference = FirebaseFirestore.instance
              .collection("chats/87hK3pA83k1SRP0efyJF/messages");

          reference.add({
            "Text": "This is added from here",
          });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection("chats/87hK3pA83k1SRP0efyJF/messages")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) => Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const Text("Hello"),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
