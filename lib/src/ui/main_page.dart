import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pax_wardrobe_app/src/provider/top_tab_index.dart';
import 'package:pax_wardrobe_app/src/ui/basic_page.dart';
import 'package:pax_wardrobe_app/src/ui/doors_page.dart';
import 'package:pax_wardrobe_app/src/ui/storage_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, _) {
                final idx = ref.watch(topTabIndex);
                return SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ref.read(topTabIndex.notifier).state = 0;
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                shape: BoxShape.circle,
                                color: idx == 0 ? Colors.black : Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                    color:
                                    idx == 0 ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Basic',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: idx == 0 ? Colors.black : Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ref.read(topTabIndex.notifier).state = 1;
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                shape: BoxShape.circle,
                                color: idx == 1 ? Colors.black : Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    color:
                                    idx == 1 ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Doors',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: idx == 1 ? Colors.black : Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ref.read(topTabIndex.notifier).state = 2;
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                shape: BoxShape.circle,
                                color: idx == 2 ? Colors.black : Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                    color:
                                    idx == 2 ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Storage',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: idx == 2 ? Colors.black : Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer(builder: (context, ref, _){
                  final idx = ref.watch(topTabIndex);
                    return IndexedStack(
                      index: idx,
                      children: const [
                        BasicPage(),
                        DoorsPage(),
                        StoragePage(),
                      ],
                    );

                }),
              ),
            ),
            Divider(
              height: 0,
              color: Colors.grey[500],
            ),
            Container(
              height: 72,
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Consumer(builder: (context, ref, _) {
                    final idx = ref.watch(topTabIndex);

                    return Container(
                      height: 58,
                      width: 58,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            var i = idx;
                            i--;
                            if (i < 1) {
                              i = 0;
                            }
                            ref.watch(topTabIndex.notifier).state = i;
                          },
                        ),
                      ),
                    );
                  }),
                  const Spacer(),
                  Consumer(
                    builder: (context, ref, _) {
                      final idx = ref.watch(topTabIndex);
                      return GestureDetector(
                        onTap: () {
                          var i = idx;
                          i++;
                          if (i > 1) {
                            i = 2;
                          }
                          ref.watch(topTabIndex.notifier).state = i;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 64),
                          child: const Center(
                            child: Text(
                              'Next',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
