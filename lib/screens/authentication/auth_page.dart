import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fragrance/services/authentication/google_auth.dart';

import '../../homepage.dart';
import '../../services/authentication/phone_auth.dart';

class auth_list extends StatelessWidget {
  const auth_list({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    final _nameController = TextEditingController();
    final _emailController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    String verify = '';

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 90,),
                Text("Find your inner peace with our app!", style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(height: 40,),
                Text("Please enter your details, to start your journey.", style: TextStyle(fontSize: 15)),
                SizedBox(height: 10,),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid name';
                          }
                          return null;
                        },
                         controller: _nameController,
                        decoration: InputDecoration(
                            label: Text("Full Name"),
                            prefixIcon: Icon(Icons.person_outline_rounded,),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            focusedBorder: OutlineInputBorder(
                            )
                        ),
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        validator: (value) {
                          if ((value == null || value.isEmpty) || EmailValidator.validate(value) == false) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                         controller: _emailController,
                        decoration: InputDecoration(
                            label: Text("Email"),
                            prefixIcon: Icon(Icons.numbers_outlined),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            focusedBorder: OutlineInputBorder()
                        ),
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        validator: (value) {
                          if ((value == null || value.isEmpty) || value?.length != 10) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                        controller: myController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            label: Text("Phone No"),
                            prefixIcon: Icon(Icons.numbers_outlined),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            focusedBorder: OutlineInputBorder()
                        ),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          minimumSize: Size(355, 50), //////// HERE
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final AuthRepository authRepository = AuthRepository();
                            await authRepository.sendVerificationCode(myController.text, context, _nameController.text, _emailController.text);
                          }
                        },
                        child: Text('SUBMIT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 10,),
                Divider(),
                SizedBox(height: 10,),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Theme.of(context).dividerColor, width: 2),
                    ),
                    child: ListTile(
                      leading: Image.asset("assets/images/g-logo.png", height: 28,),
                      title: Text("Continue with Google"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  onTap: () {
                    googleAuth().signInwithGoogle(context);
                    },
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Theme.of(context).dividerColor, width: 2),
                  ),
                  child: ListTile(
                    leading: Image.asset("assets/images/apple-logo.png", height: 28, color: Theme.of(context).secondaryHeaderColor),
                    title: Text("Continue with Apple"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
