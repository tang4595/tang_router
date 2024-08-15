import 'package:example/router_register.dart';
import 'package:flutter/material.dart';
import 'package:tang_router/tang_router.dart';

class ExamplePage extends StatefulWidget {
  final String value;

  const ExamplePage({super.key, required this.value});

  @override
  createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Example Page（${widget.value}）'),
        ),
        leading: TRouter.canPop ? Center(
          child: IconButton(
            onPressed: () => TRouter.pop(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ) : null,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            InkWell(
              onTap: () =>
                  TRouter.push(RouterRegisterA().getPath('/home')),
              child: const Text('A-home'),
            ),

            InkWell(
              onTap: () =>
                  TRouter.push(RouterRegisterA().getPath('/search')),
              child: const Text('A-search'),
            ),

            InkWell(
              onTap: () =>
                  TRouter.push(RouterRegisterA().getPath('/detail')),
              child: const Text('A-detail'),
            ),

            InkWell(
              onTap: () =>
                  TRouter.push(RouterRegisterB().getPath('/home')),
              child: const Text('B-home'),
            ),

            InkWell(
              onTap: () =>
                  TRouter.push(RouterRegisterB().getPath('/search')),
              child: const Text('B-search'),
            ),

            InkWell(
              onTap: () =>
                  TRouter.push(RouterRegisterB().getPath('/detail')),
              child: const Text('B-detail'),
            ),
          ],
        ),
      ),
    );
  }
}
