import 'package:flutter/material.dart';

void main() {
  runApp(RootClass());
}

class RootClass extends StatelessWidget {
  const RootClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: practice22(), debugShowCheckedModeBanner: false);
  }
}

class practice22 extends StatefulWidget {
  const practice22({super.key});

  @override
  State<practice22> createState() => _practice22State();
}

class _practice22State extends State<practice22> {
  TextEditingController controller = TextEditingController();
  final List<String> _tasks = [];
  void set(String text) {
    _tasks.add(text);
  }

  void remove(int index) {
    _tasks.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("day 22 practice App"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.00),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Enter something...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      setState(() {
                        set(controller.text);
                      });
                    }
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                  child: ListTile(
                    title: Text(_tasks[index]),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          remove(index);
                        });
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
