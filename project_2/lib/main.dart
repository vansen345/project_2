import 'package:flutter/material.dart';
import 'package:project_2/signUp.dart';

void main() {
  runApp(
    MaterialApp(
      home: const Login(),
    ),
  );
}

GlobalKey<FormState> scaffoldKey = GlobalKey<FormState>();

class Login extends StatefulWidget {
  // const Login({super.key});
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String password = '';
  String errorMessage = '';
  String emailErrorMessage = '';
  clearMessage() => emailErrorMessage = '';
  final emailCtr = TextEditingController();

  onChange() {
    // clearMessage();
    print('object');
    setState(() {
      emailErrorMessage = emailCtr.text.isEmpty ? 'kkkkk' : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login Form'),
      ),
      body: Form(
          key: scaffoldKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(18, 5, 12, 12),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.blue, fontSize: 34),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 18),
                child: const Text(
                  'welcome back. Please Login!',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(18, 25, 18, 18),
                child: formField(
                  controller: emailCtr,
                  name: 'Email',
                  text: 'Nhập Email',
                  icon: Icons.mail,
                  onChanged: (value) {
                    onChange();
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 9),
                child: Center(child: button('Login', 22, context)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 14),
                child: const Center(
                  child: Text(
                    'forgot your password',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(
                        255,
                        182,
                        180,
                        180,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 80),
                child: const Center(
                    child: Text(
                  'or Connect with',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(
                      255,
                      182,
                      180,
                      180,
                    ),
                  ),
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loginElse('Facebook', Colors.blue, Icons.facebook),
                  const SizedBox(
                    width: 20,
                  ),
                  loginElse('Twister', const Color.fromARGB(255, 25, 98, 159),
                      Icons.people_outline),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, right: 20),
                    child: const Text(
                      'Don\'t have account?',
                      style: TextStyle(
                        color: Color.fromARGB(
                          255,
                          182,
                          180,
                          180,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }

  Widget formField(
      {required String name,
      required TextEditingController controller,
      required String text,
      required IconData icon,
      required ValueChanged<String>? onChanged}) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          // email = value;
          // password = value;
          // if (email.isEmpty || password.isEmpty) {
          //   errorMessage = 'Empty';
          // }
          // // if()
          // // if (value.isNotEmpty) {
          // //   // Check for email format
          // //   //   if (RegExp(
          // //   //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
          // //   //       .hasMatch(value)) {
          // //   //     // Valid email formata
          // //   //     email = value;
          // //   //     print('Valid email: $email');
          // //   //   } else {
          // //   //     // Invalid email format
          // //   //     print('Invalid email format');
          // //   //   }

          // //   //   // Check for password length
          // //   //   if (value.length >= 6) {
          // //   //     // Valid password length
          // //   //     password = value;
          // //   //     print('Valid password: $password');
          // //   //   } else {
          // //   //     // Invalid password length
          // //   //     print('Password should be at least 6 characters long');
          // //   //   }
          // //   // } else {
          // //   //   // Handle empty input
          // //   //   print('Input is empty');
          // // }
          // return;

          decoration: InputDecoration(
            labelText: name,
            hintText: text,
            prefixIcon: Icon(icon),
          ),
        ),
        if (emailErrorMessage.isNotEmpty)
          Text(
            emailErrorMessage,
            style: TextStyle(color: Colors.red),
          )
      ],
    );
  }

  Widget button(String text, double n, BuildContext context) {
    return Container(
      width: 200,
      height: 40,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 168, 193, 224),
            spreadRadius: 0,
            blurRadius: 26,
            offset: Offset(0, 9),
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          // if (scaffoldKey.currentState!.validate()) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(content: Text('Processing Data')),
          //   );
          // }
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: n),
        ),
      ),
    );
  }

  Widget loginElse(String text, Color color, IconData icon) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 146, 176, 212),
            spreadRadius: 0,
            blurRadius: 20,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
              const Size(120, 42),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(color),
            padding: const MaterialStatePropertyAll(EdgeInsets.all(8))),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
