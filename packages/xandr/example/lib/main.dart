import 'package:flutter/material.dart';
import 'package:xandr/ad_banner.dart';
import 'package:xandr/ad_size.dart';
import 'package:xandr/xandr.dart';

class XandrBuilder extends FutureBuilder<bool> {
  XandrBuilder({
    required XandrController controller,
    required super.builder,
    required int memberId,
    super.key,
  }) : super(future: controller.init(memberId));
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: XandrExample());
  }
}

class XandrExample extends StatefulWidget {
  const XandrExample({super.key});

  @override
  State<XandrExample> createState() => _XandrExampleState();
}

class _XandrExampleState extends State<XandrExample> {
  late final XandrController _controller;

  @override
  void initState() {
    super.initState();

    _controller = XandrController();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.displayMedium!,
      textAlign: TextAlign.center,
      child: XandrBuilder(
        controller: _controller,
        memberId: 10094,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            debugPrint('Xandr SDK initialized, success=${snapshot.hasData}');
            return AdBanner(
              controller: _controller,
              placementID: '17058950',
              adSizes: const [AdSize(300, 250)],
              customKeywords: useDemoAds,
            );
          } else if (snapshot.hasError) {
            return const Text('Error initializing Xandr SDK');
          } else {
            return const Text('Initializing Xandr SDK...');
          }
        },
      ),
    );
  }
}
