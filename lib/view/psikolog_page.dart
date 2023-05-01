import 'package:flutter/material.dart';

import 'test_card.dart';

class PsikologPage extends StatefulWidget {
  const PsikologPage({super.key});

  @override
  State<PsikologPage> createState() => _PsikologPageState();
}

class _PsikologPageState extends State<PsikologPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(239, 252, 252, 1),
        appBar: AppBar(
          // backgroundColor: Color.fromRGBO(180, 235, 237, 1),
          title: Text(
            'PSYCOLOGIST',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Opacity(
          opacity: _animation.value,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.of(context).push(MyFadeRoute(route: RouteWhereYouGo()));
            },
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Text(
                    'Meet Our Psycologist',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(.8),
                        fontSize: 24),
                  ),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 1,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Card(
                            // color: Color.fromRGBO(215, 245, 246, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  constraints: const BoxConstraints(
                                      maxWidth: 50, maxHeight: 150),
                                  child: Image.network(
                                      'https://f.ptcdn.info/298/073/000/qs7t6ibhscUkbPBmH8t-o.jpg'),
                                ),
                              ),
                              title: Text('Jefferey Wijaya S.Psi., M.Psi'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Child Psycologist'),
                                  Text('Children'),
                                  Chip(
                                      label: Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      const Icon(Icons.work),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text('7 tahun'),
                                    ],
                                  )),
                                ],
                              ),
                              trailing: consultButton(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            )),
          ),
        ));
  }

  ElevatedButton consultButton() {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        ),
        onPressed: () {},
        child: const Text('Consult'));
  }
}
