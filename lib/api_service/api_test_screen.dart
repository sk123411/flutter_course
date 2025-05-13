import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_course/api_service/api_helper_mixin.dart';

import 'api_service.dart';
import 'person_model.dart';

class ApiTestScreen extends StatefulWidget {
  const ApiTestScreen({super.key});

  @override
  State<ApiTestScreen> createState() => _ApiTestScreenState();
}

class _ApiTestScreenState extends State<ApiTestScreen> with ApiHelperMixin {

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  List<Person>? persons;


  @override
  void initState() {
    super.initState();

    initApiHelper(context);

  }


  void _call(String label, Future Function() call) async {
    try {
      print('▶️ Calling: $label');
      final result = await call();
      print('✅ Success [$label]: $result');
    } catch (e) {
      print('❌❌ Error [$label]: $e');
    }
  }


  Future<void> getUsers() async {
    final response = await get('/users');


    if (response != null) {
      try {


        print("data ${response["users"]}");
        final List<Person> loadedUsers = (response['users'] as List)
            .map((userJson) => Person.fromJson(userJson))
            .toList();
        setState(() {
          persons = loadedUsers;
        });
      } catch (e) {
        print('❌❌ Error [/users]: $e');
        setState(() {
          persons = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load users')),
        );
      }
    }
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(

        appBar: AppBar(title: const Text("API Test")),

        body: ListView(
          padding: EdgeInsets.all(16),
          children: [

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade300,
              ),
              onPressed: () =>
                  _call("GET /success", () => get('/success')),
              child: const Text("Test Valid/Invalid endpoint (GET)"),
            ),


            SizedBox(height: 12,),


            Container(
              width: 300,
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: "Name"),
                  ),
                  TextField(
                    controller: ageController,
                    decoration: const InputDecoration(labelText: "Age"),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade300,
                        ),
                        onPressed: () =>
                            _call(
                                "POST /login (valid/invalid)",
                                    () =>
                                    post('/login', {
                                      'name': nameController.text,
                                      'age': ageController.text,
                                    })),
                        child: const Text("Test Login Success/Failed"),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade300,
                        ),
                        onPressed: () =>
                            _call(
                                "POST /register",
                                    () =>
                                    post('/register', {
                                      'name': nameController.text,
                                      'age': ageController.text,
                                    })),
                        child: const Text("Test Register"),
                      ),
                    ],
                  ),
                ],
              ),
            ),


            SizedBox(
              height: 12,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade300,
              ),
              onPressed: () => getUsers(),
              child: const Text("Get All Users"),
            ),
            const SizedBox(height: 16),
            if (persons != null)
              Container(
                height: 400,
                child: ListView.builder(
                  itemCount: persons!.length,
                  itemBuilder: (context, index) {
                    final person = persons![index];
                    return ListTile(
                      title: Text(person.name),
                      subtitle: Text("Age: ${person.age}"),
                    );
                  },
                ),
              )
            else
              Container(child: Center(child: Text("No Users")),),


            SizedBox(
              height: 48,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade300,
              ),
              onPressed: () =>
                  _call("GET /error", () => get('/error')),
              child: const Text("Test Server Error (500)"),
            ),

            SizedBox(
              height: 12,
            ),



            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade300,
              ),
              onPressed: () =>
                  _call("GET /timeout", () => get('/timeout')),
              child: const Text("Test Timeout (>10s)"),
            ),


          ],
        ),

      );
    }
  }
