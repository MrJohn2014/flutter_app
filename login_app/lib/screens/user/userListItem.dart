import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class UserListItem extends StatelessWidget {
  final num id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatarURL;
  FlatButton updateBtn;
  FlatButton deleteBtn;

  UserListItem({
     this.id,
     this.email,
     this.firstName,
     this.lastName,
     this.avatarURL,
     this.updateBtn,
     this.deleteBtn,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 0.2,
              ),
            )),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0,bottom: 10.0),
                          child: FadeInImage.memoryNetwork(
                            fit: BoxFit.cover,
                            placeholder: kTransparentImage,
                            image: avatarURL,
                          )),
                    ],
                  ),
                ),
                Expanded(
                  flex:5,
                  child: Column(
                    children: <Widget>[
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 2.0,bottom: 5.0),
                            child: new Icon(Icons.email),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 2.0,bottom: 5.0),
                            child: Text(
                              email,
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new Flexible(
                            child: Container(
                              padding: EdgeInsets.only(top: 2.0, left: 5.0, right: 2.0,bottom: 5.0),
                              child: Text(
                                firstName,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 2.0,bottom: 5.0),
                            child: Text(lastName),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Icon(Icons.update,color: Colors.grey),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5.0, left: 0.0, right: 2.0,bottom: 5.0),
                        child: updateBtn,
                      ),
                      Container(
                        child: Icon(Icons.delete,color: Colors.grey),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5.0, left: 0.0, right: 2.0,bottom: 5.0),
                        child: deleteBtn,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}