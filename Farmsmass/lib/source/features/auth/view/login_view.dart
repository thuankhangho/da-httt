import 'package:farm_smass/source/features/auth/controller/auth_controller.dart';
import 'package:farm_smass/source/features/auth/service/auth_service.dart';
import 'package:farm_smass/source/utils/loader_circle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerWidget {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  void signInWithMail(
      BuildContext context, WidgetRef ref, String email, String pw) {
    ref
        .read(authControllerProvider.notifier)
        .signInWithMail(context, email, pw);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text('Đăng nhập'),
        ),
        body: isLoading
            ? const LoaderCircle()
            : SingleChildScrollView(
                child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
                      child: FlutterLogo(
                        size: 40,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(90.0),
                          ),
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextField(
                        controller: _pwController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(90.0),
                          ),
                          labelText: 'Mật khẩu',
                        ),
                      ),
                    ),
                    Container(
                        height: 80,
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                          ),
                          child: const Text('Đăng nhập'),
                          onPressed: () {
                            signInWithMail(context, ref, _emailController.text,
                                _pwController.text);
                          },
                        )),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Quên mật khẩu?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
              )));
  }
}
