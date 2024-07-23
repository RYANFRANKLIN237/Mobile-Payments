import 'package:flutter/material.dart';
import 'package:mobile_payments/payment_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final referenceController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Momo payments'),
        elevation: 0,
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: amountController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: 'Amount',
                      hintText: 'Enter the amount',
                      border: OutlineInputBorder()),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required field';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    controller: referenceController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required field';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Reference',
                        hintText: 'Enter the reference',
                        border: OutlineInputBorder()),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                        onPressed: () {
                          if(!_formKey.currentState!.validate()){
                            return;
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage(
                            amount: amountController.text,
                            email: emailController.text,
                            reference: referenceController.text,
                          )));
                        },
                        child: const Text('Proceed to make payment')),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
