import 'package:farm_smass/source/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  void signOut(WidgetRef ref) {
    ref.read(authControllerProvider.notifier).signOut();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Trang chủ"),
        ),
        body: Column(
          children: [
            Center(
              child: Text(user?.name ?? 'random text'),
            ),
            Container(
                height: 80,
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text('Đăng xuất'),
                  onPressed: () {
                    signOut(ref);
                  },
                )),
          ],
        ));
  }
}
