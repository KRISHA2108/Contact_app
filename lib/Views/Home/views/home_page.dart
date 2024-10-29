import 'dart:io';
import 'package:contact_app/Views/Home/provider/home_provider.dart';
import 'package:contact_app/Views/Profile/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.menu, color: Colors.teal)),
        actions: [
          IconButton(
              onPressed: () async {
                bool isLock = await context.read<HomeProvider>().openLock();
                if (isLock == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please Enter Correct Password'),
                    ),
                  );
                } else {
                  Navigator.pushNamed(context, '/hide');
                }
              },
              icon: const Icon(Icons.lock, color: Colors.teal)),
          SizedBox(width: 10),
        ],
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: context.watch<HomeProvider>().contactList.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                context.read<HomeProvider>().setSelectedIndex(index);
                Navigator.pushNamed(context, '/contact_details',
                    arguments: context.read<HomeProvider>().contactList[index]);
              },
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: FileImage(
                  File(
                    context
                        .watch<HomeProvider>()
                        .contactList[index]
                        .image
                        .toString(),
                  ),
                ),
              ),
              title: Text(
                  "${context.watch<HomeProvider>().contactList[index].name}"),
              subtitle: Text(
                  "${context.watch<HomeProvider>().contactList[index].phone}"),
              trailing: IconButton(
                  onPressed: () {
                    context.read<HomeProvider>().removeContact(index);
                  },
                  icon: const Icon(Icons.delete)),
              onLongPress: () {
                Navigator.pushNamed(context, '/contact', arguments: index);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, '/contact');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
