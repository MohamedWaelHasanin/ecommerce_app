import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> _logOut(AuthController model) async{

    try {
      await model.logOut();
      if (!mounted) return;
      Navigator.pop(context);
    } on Exception catch (e) {
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
    return Consumer<AuthController>(
        builder: (_, model, _) => Center(
            child: MainButton(
                text: "",
                onTap: (){
                  _logOut(model);
                },
            ),
          ),
    );
  }
}
