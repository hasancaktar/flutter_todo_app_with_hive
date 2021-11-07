import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled/models/gorev.dart';
import 'package:untitled/widgets/gorev_satiri.dart';
import '../main.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  final _gorevBox = Hive.box(GOREV_BOX);

  ///ÖRNEK OLARAK EKLENECEK GÖREVLER
  final _gorevler = [
    Gorev(aciklama: 'aciklama1', tamamlanma: false),
    Gorev(aciklama: 'aciklama2', tamamlanma: false),
    Gorev(aciklama: 'aciklama3', tamamlanma: false),
    Gorev(aciklama: 'aciklama4', tamamlanma: false),
    Gorev(aciklama: 'aciklama5', tamamlanma: false),
    Gorev(aciklama: 'aciklama6', tamamlanma: true),
    Gorev(aciklama: 'aciklama7', tamamlanma: false),
  ];

  @override
  void initState() {
    super.initState();
    _gorevBox.values.forEach((g) => print(g.tamamlanma));
    if (_gorevBox.length == 0) _gorevBox.addAll(_gorevler);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'Yeni Görev Ekle'),
              onSubmitted: (str) {
                _gorevBox.add(Gorev(aciklama: str, tamamlanma: false));
              },
            ),
            SizedBox(height: 10),
            Expanded(
              child: ValueListenableBuilder<Box>(
                valueListenable: _gorevBox.listenable(),
                builder: (context, box, widget) {
                  return ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GorevSatiri(
                          aciklama: _gorevBox.values.elementAt(index).aciklama,
                          tamamlanma:
                              _gorevBox.values.elementAt(index).tamamlanma,
                          onTamamlanma: () {
                            setState(() {
                              _gorevBox.putAt(
                                  index,
                                  Gorev(
                                      aciklama: _gorevBox.values
                                          .elementAt(index)
                                          .aciklama,
                                      tamamlanma: !_gorevBox.values
                                          .elementAt(index)
                                          .tamamlanma));
                            });
                          },
                          onSilinme: () {
                            _gorevBox.deleteAt(index);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
