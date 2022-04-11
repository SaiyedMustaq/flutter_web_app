import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app/colors.dart';

class RightTopSearch extends StatelessWidget {
  const RightTopSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 50, right: 50),
        height: 60,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Row(
          children: [
            const Text(
              'Documents',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Search',
                            contentPadding: EdgeInsets.only(left: 20),
                            border: InputBorder.none),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: appColor.primaryColor,
                          borderRadius: BorderRadius.circular(10.0)),
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(10.0),
                      child: const Icon(
                        CupertinoIcons.search,
                        color: Colors.white,
                        size: 18.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 60,
                    padding: const EdgeInsets.all(15.0),
                    child: ClipOval(
                      child: Image.network(
                        'https://i.picsum.photos/id/868/200/200.jpg?hmac=TH6VPbfiRO1pMY4ZYWqECwlH8wSnlxN_KlCVOzTpbe8',
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                  const Text(
                    "User Name",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            )
          ],
        ));
  }
}
