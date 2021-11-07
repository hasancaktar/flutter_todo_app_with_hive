import 'package:flutter/material.dart';

class GorevSatiri extends StatelessWidget {

  ///GÖREV MODELİ
  final String aciklama;
  final bool tamamlanma;
  final VoidCallback onTamamlanma;
  final VoidCallback onSilinme;

  const GorevSatiri(
      {Key? key,
      required this.aciklama,
      this.tamamlanma = false,
      required this.onTamamlanma,
      required this.onSilinme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    ///GÖREV SATIRI
    return Row(
      children: [
        InkWell(
          onTap: () {
            onTamamlanma();

          },
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                color: tamamlanma ? Colors.blue : Colors.white,
                border: Border.all(color: Colors.blueGrey)),
          ),
        ),
        SizedBox(width: 5),
        Text(
          aciklama,
          style: TextStyle(
              decoration: tamamlanma
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        IconButton(
            onPressed: () {
              onSilinme();
            },
            icon: Icon(Icons.delete))
      ],
    );
  }
}
