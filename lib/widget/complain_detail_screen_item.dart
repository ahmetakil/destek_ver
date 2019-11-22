import 'package:DestekVer/screens/map_screen.dart';
import 'package:DestekVer/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/complain.dart';

class ComplainDetailScreenItem extends StatefulWidget {
  final Complain comp;

  ComplainDetailScreenItem(this.comp);

  @override
  _ComplainDetailScreenItemState createState() =>
      _ComplainDetailScreenItemState();
}

class _ComplainDetailScreenItemState extends State<ComplainDetailScreenItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.comp.complainTopic,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontSize: screenSize(20,context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              Text(
                DateFormat('dd/MM/yyyy').format(widget.comp.dateTime),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    size: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        widget.comp.username,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.comp.complain,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (widget.comp.imageUrl != null)
                    Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 250,
                      child: Image.network(
                        widget.comp.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  if (widget.comp.replied)
                    Container(
                      padding: EdgeInsets.all(6),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Belediyenin Cevabı : ",
                        style: TextStyle(
                            fontSize: 18,
                            color: widget.comp.solved
                                ? Colors.green
                                : Colors.amber[800]),
                      ),
                    ),
                  if (widget.comp.replied && !widget.comp.solved)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Merhaba, Şikayetiniz ilgili birim tarafından işleme alınmış olup çözüm süreci başlatılmıştır. Sizi bu süreçteki gelişmelerden haberdar ediyor olacağız. Konuyla ilgili hassasiyetiniz için teşekkür ederiz.",
                        style:
                            TextStyle(color: Colors.amber[800], fontSize: 16),
                      ),
                    ),
                  if (widget.comp.solved)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Merhaba, Şikayetiniz üzerine başlatılan süreç tamamlanmış olup şikayetiniz çözüme ulaştırılmıştır. Çözümü değerlendirmek için memnuniyet anketimize katılabilir, başka bir sorun iletmek için yeni bir şikayet oluşturabilirsiniz. Konuyla ilgili hassasiyetiniz için teşekkür ederiz.",
                        style:
                            TextStyle(color: Colors.green, fontSize: 16),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
        Divider(
          thickness: 0.2,
          color: Colors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: widget.comp.upvoted
                      ? Icon(Icons.check, color: Colors.green)
                      : Icon(Icons.check),
                  onPressed: () => setState(
                    () {
                      if (widget.comp.upvoted) {
                        widget.comp.upVote--;
                        widget.comp.upvoted = false;
                      } else {
                        widget.comp.upVote++;
                        widget.comp.upvoted = true;
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  widget.comp.upVote.toString(),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (_) => MapScreen(widget.comp.location))),
                  child: Text(
                    widget.comp.fullAddress,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
/*
Resme padding + biraz aşağı indir
isim sansürleme Fatih Ö.

- Herkesin profili kendine
Profilim appbar için

 */
