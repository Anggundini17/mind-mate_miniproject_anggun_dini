import 'package:flutter/material.dart';
import 'package:mind_mate_app/models/psikolog.dart';

import 'package:mind_mate_app/view_model/psikolog_provider.dart';
import 'package:provider/provider.dart';

import '../../view_model/db_manager_provider.dart';

import '../widget/animation.dart';
import 'consult.dart';
import 'detail_psikolog.dart';

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

    Future.microtask(
      () => Provider.of<PsikologProvider>(context, listen: false)
          .getPsikologList(),
    );

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
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
        backgroundColor: const Color.fromRGBO(239, 252, 252, 1),
        appBar: AppBar(
          // backgroundColor: Color.fromRGBO(180, 235, 237, 1),
          title: const Text(
            'PSYCOLOGIST',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Opacity(
          opacity: _animation.value,
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  'Meet Our Psycologist',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(.8),
                      fontSize: 24),
                ),
              ),
              Consumer<PsikologProvider>(
                builder: (context, provPsikolog, child) {
                  if (provPsikolog.requestState == PsikologViewState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (provPsikolog.requestState ==
                      PsikologViewState.loaded) {
                    final psikolog = provPsikolog.listPsikolog;
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: psikolog.length,
                        itemBuilder: ((context, index) {
                          final psikologData = psikolog[index];
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: CardPsikolog(psikologData: psikologData),
                          );
                        }));
                  } else {
                    return const Center(child: Text('Error'));
                  }
                },
              ),
            ],
          )),
        ));
  }
}

class CardPsikolog extends StatelessWidget {
  const CardPsikolog({
    Key? key,
    required this.psikologData,
  }) : super(key: key);

  final Psikolog psikologData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: const Color.fromRGBO(239, 252, 252, 1),
          // constraints: BoxConstraints(maxHeight: double.infinity),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          builder: (context) => DetailPsikolog(
            psikolog: psikologData,
          ),
        );
      },
      child: SizedBox(
        height: 150,
        child: Card(
          // color: Color.fromRGBO(215, 245, 246, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: SizedBox(
                // height: 100,
                width: MediaQuery.of(context).size.width * 0.125,
                child: Image.network(
                  // 'https://f.ptcdn.info/298/073/000/qs7t6ibhscUkbPBmH8t-o.jpg',
                  psikologData.avatar,
                  fit: BoxFit.cover,
                  // scale: 25.0,
                ),
              ),
            ),
            title: Text(
              psikologData.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(psikologData.specialist),
                Text(
                  psikologData.expert,
                  overflow: TextOverflow.ellipsis,
                ),
                Chip(
                    label: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(Icons.work),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(psikologData.timeExperience),
                  ],
                )),
              ],
            ),
            trailing: ConsultButton(
              psikologDataId: psikologData,
            ),
          ),
        ),
      ),
    );
  }
}

class ConsultButton extends StatelessWidget {
  const ConsultButton({
    Key? key,
    required this.psikologDataId,
  }) : super(key: key);

  final Psikolog psikologDataId;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromRGBO(37, 109, 121, 1)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
        ),
        onPressed: () {
          print(psikologDataId);
          Navigator.of(context).push(
            MyFadeRoute(
              route: ConsultationPage(
                // title: 'Consultation Form',
                pageStatus: PageStatus.addNew,
                getPsikolog: psikologDataId,
              ),
            ),
          );
        },
        child: const Text(
          'Consult',
          style: TextStyle(
              // color: Colors.black.withOpacity(.8),
              ),
        ));
  }
}
