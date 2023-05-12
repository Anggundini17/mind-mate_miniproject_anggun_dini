import 'package:flutter/material.dart';

import 'package:mind_mate_app/view_model/psikolog_provider.dart';
import 'package:provider/provider.dart';
import '../../psikolog/psikolog_page.dart';
import '../animation.dart';

class PreviewPsikolog extends StatefulWidget {
  const PreviewPsikolog({
    Key? key,
  }) : super(key: key);

  @override
  State<PreviewPsikolog> createState() => _PreviewPsikologState();
}

class _PreviewPsikologState extends State<PreviewPsikolog> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<PsikologProvider>(context, listen: false)
          .getPsikologList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Our Psycologist',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(35, 75, 86, 1)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MyFadeRoute(
                        route: const PsikologPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'See More',
                    style: TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(35, 75, 86, 1)),
                  ),
                ),
              ],
            )),
        const SizedBox(
          height: 10,
        ),
        Consumer<PsikologProvider>(
          builder: (context, provPsikolog, child) {
            if (provPsikolog.requestState == PsikologViewState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (provPsikolog.requestState == PsikologViewState.loaded) {
              final psikolog = provPsikolog.listPsikolog;
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: ((context, index) {
                    final psikologData = psikolog[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: CardPsikolog(psikologData: psikologData),
                    );
                  }));
            } else {
              return const Center(child: Text('Error'));
            }
          },
        ),
      ],
    );
  }
}
