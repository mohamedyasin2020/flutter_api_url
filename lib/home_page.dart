import 'package:flutter/material.dart';
import 'package:flutter_apiurl_yasin/model_page.dart';
import 'package:flutter_apiurl_yasin/server_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Details> _lessons = [];

  @override
  void initState() {
    super.initState();
    _loadLessons();
  }

  Future<void> _loadLessons() async {
    try {
      List<Details> response = await Lessonserver.fetchLessons();

      setState(() {
        _lessons = response;
      });
    } catch (e) {
      print('Error loading lessons: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Data'),
      ),
      body: _lessons == null || _lessons.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
          itemCount: _lessons.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Text('Address: ${_lessons[index].postId}'),
                  Text('Id: ${_lessons[index].id}'),
                  Text('Name: ${_lessons[index].name}'),
                  Text('Phone: ${_lessons[index].email}'),
                  Text('Email: ${_lessons[index].body}'),
                ],
              ),
            );
          }),
    );
  }
}
