import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:golden_test/screens/counter/counter.dart';
import 'package:golden_test/widgets/custom_text_field.dart';
import 'package:golden_test/widgets/login_store.dart';

void main() {
  runApp(const MyApp());
}

final counter = Counter();
final loginStore = LoginStore();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // chamada teste mobx 01
      home: const MyHomePage(title: 'Flutter test Mobx'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Counter counter = Counter();
  LoginStore loginStore = LoginStore();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(builder: (_) {
              return Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
            // CustomTextField(
            //   controller: emailController,
            //   label: 'E-mail',
            //   icon: Icons.email,
            //   onChanged: loginStore.setEmail,
            // ),
            // CustomTextField(
            //   controller: passwordController,
            //   label: 'Senha',
            //   icon: Icons.password,
            //   isSecret: true,
            //   onChanged: loginStore.setPassword,
            // ),
            TextFormField(
              controller: emailController,
              onChanged: loginStore.setEmail,
            ),
            TextFormField(
              controller: passwordController,
              onChanged: loginStore.setPassword,
            ),
            Observer(builder: (_) {
              return Text(
                'Form - ${loginStore.isFormValid}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
            Observer(builder: (_) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple, // foreground
                ),
                onPressed: loginStore.isFormValid ? () {} : null,
                child: const Text('Btn teste'),
              );
            }),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
              onPressed: () {},
              child: const Text('Esqueceu a senha'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
