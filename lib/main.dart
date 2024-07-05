import 'package:flutter/material.dart';
import 'dart:ui'; // Required for BackdropFilter and ImageFilter

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVFMjgIo8Rh07xuZ9QWissmEWuxVrGdHvhVg&s'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Blurring effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color:
                  Colors.black.withOpacity(0.1), // Adjust the opacity if needed
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text('HOME'),
              centerTitle: true,
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              backgroundColor: Color.fromARGB(255, 25, 159, 123),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()),
                      );
                    },
                    child: Text('Go to Profile =>'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MemberScreen()),
                      );
                    },
                    child: Text('Go to Member Screen =>'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROFILE'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        backgroundColor: Color.fromARGB(255, 48, 95, 153),
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/download.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color:
                  Colors.black.withOpacity(0.1), // Adjust the opacity if needed
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 90,
                      backgroundImage: AssetImage('assets/images/photo.jpg'),
                    ),
                    const Text(
                      'Subinraj S',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Lobster',
                      ),
                    ),
                    Text(
                      'Flutter Developer'.toUpperCase(),
                      style: const TextStyle(
                        color: Color.fromARGB(179, 0, 0, 0),
                        fontSize: 25,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      width: 150,
                      child: Divider(
                        height: 10,
                        thickness: 1,
                        color: Colors.white54,
                      ),
                    ),
                    const Card(
                      elevation: 8,
                      color: Colors.white,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      child: ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.teal,
                        ),
                        title: Text(
                          '+8848226809',
                          style: TextStyle(color: Colors.teal),
                        ),
                      ),
                    ),
                    const Card(
                      elevation: 8,
                      color: Colors.white,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'xenocide@gmail.com',
                          style: TextStyle(color: Colors.teal),
                        ),
                      ),
                    ),
                    const Card(
                      elevation: 8,
                      color: Colors.white,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      child: ListTile(
                        leading: Icon(
                          Icons.add_location_outlined,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'Technopark phase 4,Trivandrum',
                          style: TextStyle(color: Colors.teal),
                        ),
                      ),
                    ),
                    const Card(
                      elevation: 8,
                      color: Colors.white,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      child: ListTile(
                        leading: Icon(
                          Icons.skateboarding_outlined,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'Drawing/Footbal/Travel',
                          style: TextStyle(color: Colors.teal),
                        ),
                      ),
                    ),
                    const Card(
                      elevation: 8,
                      color: Colors.white,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      child: ListTile(
                        leading: Icon(
                          Icons.accessibility_outlined,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'Hi there! I am a B.Tech Computer Science student at Marian College, passionate about exploring the ever-evolving world of technology.',
                          style: TextStyle(color: Colors.teal),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Member {
  String name;

  Member(this.name);
}

class MemberScreen extends StatefulWidget {
  @override
  _MemberScreenState createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  TextEditingController _controller = TextEditingController();
  List<Member> _members = [];

  void _addMember() {
    setState(() {
      String name = _controller.text;
      if (name.isNotEmpty && _members.length < 5) {
        _members.add(Member(name));
        _controller.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 173, 85),
        title: const Text('Xenocide'),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        centerTitle: true,
        elevation: 10,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Enter xen member name',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _addMember,
                  child: Text('Add Member'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _members.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  elevation: 8,
                  child: ListTile(
                    title: Text(_members[index].name),
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
