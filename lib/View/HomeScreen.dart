import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Model/UserListModel.dart';
import '../ViewModel/HomeViewModel/HomeViewModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final homeProvider = Provider.of<HomeViewModel>(context, listen: false);
    Future.delayed(Duration.zero, () {
      homeProvider.getUserListApi(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeViewModel>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Deshboard"),
          centerTitle: true,
          backgroundColor: Colors.cyan,
          actions: const [],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: Column(
            children: [
              Container(

              ),
              InkWell(
                  onTap: () {
                    print(homeProvider.historyleaveData);
                  },
                  child:Consumer<HomeViewModel>(
                      builder: (context, value, child) {
                        return Text(
                          value.historyleaveData.data!.page.toString(),
                          style: const TextStyle(color: Colors.cyan),
                        );
                      }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
