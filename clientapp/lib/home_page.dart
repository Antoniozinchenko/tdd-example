import 'package:clientapp/api/my_api.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> data = [];

  Future<void> onRefresh() async {
    final result = await GetIt.I.get<MyApi>().fetchData();
    setState(() {
      data = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomePageContent(
      data: data,
      onRefresh: onRefresh,
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent(
      {super.key, required this.data, required this.onRefresh});

  final List<String> data;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parse Strings Page'),
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: onRefresh,
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (_, index) => ListTile(
            key: ValueKey(index),
            title: Text(data[index]),
          ),
        ),
      ),
    );
  }
}
