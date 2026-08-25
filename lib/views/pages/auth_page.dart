import 'package:ecommerce_app/utilities/routes.dart';
import 'package:ecommerce_app/views/widgets/main_button.dart';
import 'package:flutter/material.dart';

import '../../utilities/enums.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  var _authType = AuthFormType.login;

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 64, horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _authType == AuthFormType.login ? 'Login' : 'Register',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 80.0),
                TextFormField(
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(_passwordFocusNode),
                  textInputAction: TextInputAction.next,
                  validator: (val) =>
                      val!.isEmpty ? 'please enter your email' : null,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  validator: (val) =>
                      val!.isEmpty ? 'please enter your password' : null,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                ),
                const SizedBox(height: 10.0),
                if (_authType == AuthFormType.login)
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      child: const Text('Forgot your password?'),
                      onTap: () {},
                    ),
                  ),
                const SizedBox(height: 24.0),
                MainButton(
                  text: _authType == AuthFormType.login ? 'Login' : 'Register',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pushNamed(AppRoutes.bottomNavBarRoute);
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    child: Text(
                      _authType == AuthFormType.login
                          ? 'Don\'t have an account? Register'
                          : 'Have an account? Login',
                    ),
                    onTap: () {
                      _formKey.currentState!.reset();
                      setState(() {
                        if (_authType == AuthFormType.login) {
                          _authType = AuthFormType.register;
                        } else {
                          _authType = AuthFormType.login;
                        }
                      });
                    },
                  ),
                ),
                const Spacer(),
                Center(
                  child: Text(
                    _authType == AuthFormType.login
                        ? 'Or Login with social account'
                        : 'Or Register with social account',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.white,
                        ),
                        child: Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.white,
                        ),
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
