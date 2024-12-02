import 'package:flutter/material.dart';
import 'package:flutter_assignment_2/models/random_user.dart';
import 'package:flutter_assignment_2/shared/styled_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiDataScreen extends StatefulWidget {
  const ApiDataScreen({super.key});

  @override
  State<ApiDataScreen> createState() => _ApiDataScreenState();
}

class _ApiDataScreenState extends State<ApiDataScreen> {
  Future<List<RandomUser>>? _usersFuture;

  Future<List<RandomUser>> fetchUsers({int size = 5}) async {
    try {
      var url = Uri.parse('https://randomuser.me/api/?page=3&results=$size&inc=name,id');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        List<dynamic> results = jsonResponse['results'];

        List<RandomUser> userList = results.map((userData) {
          return RandomUser.fromJson(userData as Map<String, dynamic>);
        }).toList();

        return userList;
      } else {
        return [];
      }
    } catch (err) {
      throw Exception("Failed to load users");
    }
  }

  void refreshUsers() {
    setState(() {
      _usersFuture = fetchUsers();
    });
  }

  @override
  void initState() {
    super.initState();
    _usersFuture = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Data Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: refreshUsers,
          ),
        ],
      ),
      body: FutureBuilder<List<RandomUser>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No users found',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          final users = snapshot.data!;
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: users.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(
                    user.name[0].toUpperCase(),
                  ),
                ),
                title: StyledHeading("${user.name}"),
                subtitle: StyledText("ID: ${user.id}"),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('User selected!  ${user.name}'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
