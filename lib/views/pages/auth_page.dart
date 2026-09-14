import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/services/auth.dart';
import 'package:ecommerce_app/utilities/routes.dart';
import 'package:ecommerce_app/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  // var _authType = AuthFormType.login;

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit(AuthController model) async {
    try {
      await model.submit();
      if (!mounted) return;
      Navigator.of(context).pushNamed(AppRoutes.landingPageRoute);
    } catch (e) {
      // TODO there is refactor
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Error',style: Theme.of(context).textTheme.headlineSmall,),
            content: Text(e.toString(),style: Theme.of(context).textTheme.titleMedium,),
            actions: [
              TextButton(onPressed: ()=>Navigator.of(context).pop(), child:const Text('OK'))
            ],
          ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return Consumer<AuthController>(
      builder: (_, model, _) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              vertical: 64,
              horizontal: 24,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.authFormType == AuthFormType.login
                        ? 'Login'
                        : 'Register',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 80.0),
                  TextFormField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    onEditingComplete: () =>
                        FocusScope.of(context)
                            .requestFocus(_passwordFocusNode),
                    textInputAction: TextInputAction.next,
                    onChanged: model.updateEmail,
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
                    onChanged: model.updatePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  if (model.authFormType == AuthFormType.login)
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: const Text('Forgot your password?'),
                        onTap: () {},
                      ),
                    ),
                  const SizedBox(height: 24.0),
                  MainButton(
                    text: model.authFormType == AuthFormType.login
                        ? 'Login'
                        : 'Register',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _submit(model);
                        // Navigator.of(context).pushNamed(AppRoutes.bottomNavBarRoute);
                      }
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      child: Text(
                        model.authFormType == AuthFormType.login
                            ? 'Don\'t have an account? Register'
                            : 'Have an account? Login',
                      ),
                      onTap: () {
                        _formKey.currentState!.reset();
                        model.toggleFormType();
                      },
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: Text(
                      model.authFormType == AuthFormType.login
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
      ),
    );
  }
}
