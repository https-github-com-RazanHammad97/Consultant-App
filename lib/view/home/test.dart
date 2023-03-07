// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:consultant_app/model/category/Categories.dart';
import 'package:consultant_app/model/mail/MailData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/remote/response/ApiResponse.dart';
import '../../model/mail/Tags.dart';
import '../../views/widgets/tiles/TagTile.dart';
import '../widgets/LoadingWidget.dart';
import '../widgets/MyErrorWidget.dart';
import 'HomeVM.dart';

List<Entry> data = <Entry>[];

class ExpansionTileSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeVM viewModel = HomeVM();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ExpansionTile'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(21),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('reeem'),
            const SizedBox(height: 24),
            ChangeNotifierProvider(
              create: (BuildContext context) => viewModel,
              child: Consumer<HomeVM>(builder: (context, viewModel, _) {
                switch (viewModel.tagsMain.status) {
                  case Status.LOADING:
                    print("tagsMain :: LOADING");
                    return LoadingWidget();
                  case Status.ERROR:
                    print("tagsMain :: ERROR ");
                    return MyErrorWidget(viewModel.tagsMain.message ?? "NA");
                  case Status.COMPLETED:
                    print("tagsMain :: COMPLETED");
                    return _getTagsList(viewModel.tagsMain.data!.tags!);
                  default:
                }
                return Container();
              }),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget _getTagsList(List<Tags> tags) {
  return Container(
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(22))),
    child: GridView.builder(
      // padding: padding,
      shrinkWrap: true,
      padding: EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          // maxCrossAxisExtent: 200,
          childAspectRatio: 5 / 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8
          //   childAspectRatio: 1.75,
          ),
      itemBuilder: (context, i) => TagTile(tags[i]),
      itemCount: 4,
    ),
  );
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <MailData>[]]);

  final String title;
  final List<MailData> children;

  @override
  String toString() {
    return 'Entry{title: $title, children: $children}';
  }
}

Future<List<Entry>> _test(HomeVM viewModel) async {
  data = <Entry>[];
  List<Categories> cats = viewModel.catMain.data!.categories!;
  List<MailData> mails = viewModel.mailMain.data!.mails!.data!;
  List<MailData> tmp = [];
  for (int i = 0; i < cats.length; i++) {
    for (int j = 0; j < mails.length; j++) {
      if (mails[j].sender!.category!.name == cats[i].name) tmp.add(mails[j]);
    }
    data.add(Entry(cats[i].name!, tmp));
    print('size: ${cats.length}, name: ${cats[i].name!}');
    print('tmp: ${tmp} ');
    print(' num of tmp: ${tmp.length}');
    tmp = [];
  }
  return data;
}

void main() {
  runApp(ExpansionTileSample());
}

// // Displays one Entry. If the entry has children then it's displayed
// // with an ExpansionTile.
// class EntryItem extends StatelessWidget {
//   const EntryItem(this.entry);
//
//   final Entry entry;
//   Widget _buildTiles(Entry root) {
//     if (root.children.isEmpty) return ListTile(title: Text(root.title));
//     return ExpansionTile(
//         key: PageStorageKey<Entry>(root),
//         // title: Text(root.title),
//         // children: <Widget>[
//         //   for (var item in root.children) Text(item.subject!),
//         title: Text("You title text"),
//         children: [
//           Flexible(
//             child: ListView.builder(
//                 shrinkWrap: true,
//                 primary: false,
//                 physics: NeverScrollableScrollPhysics(),
//                 scrollDirection: Axis.vertical,
//                 itemCount: entry.children.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Text(entry.children![index].decision!);
//                 }),
//           )
//           //  OrgTile(item),
//         ]
//         //   children: ListView.builder(
//         //   itemBuilder: (context, position) => StatusTile(statusList[position]),
//         //   itemCount: statusList.length,
//         // ),
//         );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _buildTiles(entry);
//   }
// }
