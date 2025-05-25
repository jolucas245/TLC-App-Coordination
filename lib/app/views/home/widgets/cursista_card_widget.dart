
import 'package:flutter/material.dart';

class CursistaCardWidget extends StatelessWidget {

  final String name;
  final String address;
  final String phone;
  final bool isCheck;

  const CursistaCardWidget({
    super.key,
    required this.name,
    required this.address,
    required this.phone,
    required this.isCheck
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
    children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.person_outline_outlined, size: 20, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, size: 20, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      address,
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 13),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.phone_outlined, size: 20, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      phone,
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 130,
              height: 40,
              child: !isCheck 
              ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {},
                child: Text(
                  "Marcar visita",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ) 
              : OutlinedButton(
                onPressed: (){}, 
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Color(0xff31C765)
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                ),
                child: Text(
                  "Visitado",
                  style: TextStyle(color: Color(0xff31C765), fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      isCheck ? Positioned(
        left: 0,
        top: 0,
        bottom: 0,
        child: Container(
          width: 5,
          decoration: BoxDecoration(
            color: Color(0xff31C765),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
          ),
        ),
      ) : SizedBox.shrink(),
    ],
  );
  }
}