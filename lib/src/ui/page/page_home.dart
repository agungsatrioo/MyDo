import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mydo/src/model/model_mydo_item.dart';
import 'package:mydo/src/ui/page/page_mydo_form.dart';
import 'package:mydo/src/ui/widget/widget_basic.dart';
import 'package:mydo/src/ui/widget/widget_mydo_item.dart';
import 'package:mydo/src/util/util_database.dart';

class HomePage extends StatefulWidget {
  @override
  DatabaseHelper db = DatabaseHelper();

  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<MyDoItem>> _builder;

  @override
  initState() {
    super.initState();

    _builder = widget.db.getItemList();
  }

  Future<void> _refresh() async {
    setState(() {
      _builder = widget.db.getItemList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyDo"),
      ),
      body: Container(
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: FutureBuilder<List<MyDoItem>>(
              future: _builder,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return loading();
                  default:
                    if (snapshot.hasError) {
                      return Center(child: Text("Gagal memuat catatan"));
                    } else if (snapshot.data.isNotEmpty) {
                      return Container(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: snapshot.data.map((item) =>
                              MyDoItemWidget()).toList(),
                        ),
                      );
                    } else {
                      return Center(child: Text("Tidak ada data."));
                    }
                }
              },
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyDoFormPage()));
        },
        child: Icon(LineIcons.plus),
      ),
    );
  }
}