import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/page2.dart';

class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpage();
}

class _firstpage extends State<firstpage> {
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
              padding: EdgeInsets.only(left: 12),
              child: Text(
                'Todo app',
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
            color: Color.fromARGB(255, 14, 83, 211),
          ),
        ),
        //  centerTitle: true,
        // toolbarHeight: 75,
        // elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://imageio.forbes.com/specials-images/dam/imageserve/1092571024/960x0.jpg?height=474&width=711&fit=bounds'),
            fit: BoxFit.fitHeight,
            scale: 200,
          ),
        ),
        //margin: const EdgeInsets.all(10),
      ),
    );
  }
}
