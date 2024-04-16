import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/page1.dart';

class secondpage extends StatefulWidget {
  const secondpage({super.key});

  @override
  State<secondpage> createState() => _secondpage();
}

class _secondpage extends State<secondpage> {
  List todoList = [];
  String singlevalue = "";

  addString(content) {
    setState(() {
      singlevalue = content;
    });
  }

  addList() {
    setState(() {
      todoList.add({"value": singlevalue});
    });
  }

  deleteItem(index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            // SizedBox(
            //   height: 30,
            // ),
            const DrawerHeader(
              margin: EdgeInsets.all(30),
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(199, 0, 0, 0)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ListTile(
              leading: Icon(Icons.star),
              iconColor: Color.fromARGB(196, 68, 58, 135),
              title: const Text(
                'Home Page',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),

              //   iconColor: Colors.black87,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => firstpage()));
              },
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Icon(Icons.star),
              iconColor: Color.fromARGB(196, 68, 58, 135),
              title: const Text(
                'Todo Page',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => secondpage()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Todo Application",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 40,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 75,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 90,
              child: ListView.builder(
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: const Color.fromARGB(196, 255, 153, 0),
                      child: SizedBox(
                        height: 50,
                        // width: double.infinity,
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 100,
                                child: Text(
                                  todoList[index]['value'].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 15,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.white,
                                    child: TextButton(
                                      onPressed: () {
                                        deleteItem(index);
                                      },
                                      child: const Icon(
                                        Icons.delete,
                                        size: 25,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      flex: 70,
                      child: Container(
                        height: 70,
                        child: TextFormField(
                          onChanged: (content) {
                            addString(content);
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              fillColor: Color.fromARGB(176, 68, 79, 168),
                              filled: true,
                              labelText: 'Create Task....',
                              labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              )),
                        ),
                      ),
                    ),
                    const Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: 3,
                        )),
                    Expanded(
                        flex: 27,
                        child: ElevatedButton(
                          onPressed: () {
                            addList();
                          },
                          child: Container(
                              height: 50,
                              //width: double.infinity,
                              alignment: Alignment.center,
                              child: const Text(
                                "Add",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w800),
                              )),
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
