import 'package:dezynex_test/src/views/widgets/list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false).getAllList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text("Machine Test"),
      centerTitle: true,
    );
  }

  Consumer<HomeProvider> _body() {
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final list = value.list;
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final newList = list[index];

            return ListItemWidget(newList: newList);
          },
        );
      },
    );
  }
}
