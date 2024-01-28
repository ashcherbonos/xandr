import 'package:flutter/material.dart';

class XandrController {
  Future<bool> init({
    required int memberId,
  }) async {
    return true;
  }
}

class AdSize {
  const AdSize(this.width, this.height);
  final int width;
  final int height;

  Map<String, int> toJson() => <String, int>{
        'width': width,
        'height': height,
      };
}

typedef CustomKeywords = Map<String, String>;

const CustomKeywords useDemoAds = {'kw': 'demoads'};

class XandrBuilder extends FutureBuilder<bool> {
  XandrBuilder({
    required XandrController controller,
    required super.builder,
    required int memberId,
    super.key,
  }) : super(future: controller.init(memberId: memberId));
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

class AdBanner extends StatelessWidget {
  const AdBanner({
    required this.inventoryCode,
    required this.adSizes,
    required this.controller,
    super.key,
    this.customKeywords,
  });
  final String inventoryCode;
  final List<AdSize> adSizes;
  final CustomKeywords? customKeywords;
  final XandrController controller;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
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
        memberId: 123,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return AdBanner(
              controller: _controller,
              inventoryCode: 'test',
              adSizes: const [AdSize(728, 90)],
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
