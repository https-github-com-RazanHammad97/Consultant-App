import 'package:flutter/material.dart';

import '../../model/mail/Tags.dart';
import '../../views/widgets/tiles/TagTile.dart';

class TagList extends StatelessWidget {
  List<Tags> tags;
  TagList(this.tags, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(22))),
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            // maxCrossAxisExtent: 200,
            childAspectRatio: 5 / 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8
            //   childAspectRatio: 1.75,
            ),
        itemBuilder: (context, i) => TagTile(tags[i]),
        itemCount: tags.length,
      ),
    );
  }
}
