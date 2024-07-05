import 'package:flutter/material.dart';
import 'package:prime_number/controller/prime_number_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PrimeNumberController controller = PrimeNumberController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: formKey,
                  child: TextFormField(
                    controller: controller.textController,
                    validator: (value) => controller.validateInteger(value),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter a number',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    if (formKey.currentState!.validate()) {
                      controller.checkPrimeNumber();
                    }
                    setState(() {});
                  },
                  child: const Text('Check'),
                ),
                Text(
                  formKey.currentState?.validate() ?? false
                      ? '${controller.textController.text} ${controller.result}'
                      : '',
                  style: TextStyle(
                      fontSize: 20,
                      color: controller.isPrime ? Colors.green : Colors.red),
                ),
                Text(
                  formKey.currentState?.validate() ?? false
                      ? 'Time taken: ${controller.timeTaken}ms'
                      : '',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
