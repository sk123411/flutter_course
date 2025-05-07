import 'dart:convert';

import 'package:flutter/material.dart';

import 'api_service.dart';
import 'person_model.dart';

class ApiTestScreen extends StatefulWidget {
  const ApiTestScreen({super.key});

  @override
  State<ApiTestScreen> createState() => _ApiTestScreenState();
}

class _ApiTestScreenState extends State<ApiTestScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  List<Person>? persons;


  void _call(String label, Future Function() call) async {
    try {
      print('▶️ Calling: $label');
      final result = await call();
      print('✅ Success [$label]: $result');
    } catch (e) {
      print('❌❌ Error [$label]: $e');
    }
  }


  Future<void> getUsers(ApiService api) async {
    final response = await api.getRequest('/users');


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
      final api = ApiService.withContext(context);
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
                  _call("GET /success", () => api.getRequest('/success')),
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
                                    api.postRequest('/login', {
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
                                    api.postRequest('/register', {
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
              onPressed: () => getUsers(api),
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
                  _call("GET /error", () => api.getRequest('/error')),
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
                  _call("GET /timeout", () => api.getRequest('/timeout')),
              child: const Text("Test Timeout (>10s)"),
            ),


          ],
        ),

      );
    }
  }
