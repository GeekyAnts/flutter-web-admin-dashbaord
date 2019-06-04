import 'package:flutter_web/material.dart';
import 'package:website/utils/raw_data.dart';

import 'hero_object.dart';

class HeroAnimation extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 2.0,
          child: Container(
            child: PhotoHero(
              photo: 'ironman.png',
              width: 300.0,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return Scaffold(
                    body: Container(
                      decoration: new BoxDecoration(
                        gradient: new LinearGradient(
                            colors: [
                              Colors.amberAccent,
                              Colors.red,
                              Colors.redAccent,
                              Colors.amber
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.0, 0.3, 0.6, 1.0],
                            tileMode: TileMode.repeated),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.topLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 4.5,
                                bottom: 200),
                            child: PhotoHero(
                              photo: 'ironman.png',
                              width: MediaQuery.of(context).size.width / 4,
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          Flexible(
                            child: Card(
                              child: Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(12),
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width / 4,
                                child: ListView(
                                  children:
                                      List<Widget>.generate(quotes.length, (i) {
                                    return quotesBuilder(quotes[i]);
                                  }),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            alignment: Alignment.topCenter,
                            child: IconButton(
                              iconSize: 40,
                              icon: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }));
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget quotesBuilder(String quote) {
    return Container(
      margin: EdgeInsets.fromLTRB(32, 16, 32, 16),
      child: Text(
        quote,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 18,
          //fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'GoogleSans',
        ),
      ),
    );
  }
}
