import 'package:flutter/material.dart';

Widget CardBuilder(
    {required Icon icon, required String text, required String count}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
            10.0), // Optional: Add border radius for rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10.0,
            left: 10.0,
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 251, 248, 248),
              ),
              child: Center(
                child: icon,
              ),
            ),
          ),
          const SizedBox(
            height: 180.0,
            width: 150.0,
          ),
          Positioned(
              bottom: 50,
              left: 10,
              child: Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.w400),
              )),
          Positioned(
              bottom: 25,
              left: 10,
              child: Text(
                count,
                style: const TextStyle(fontWeight: FontWeight.w600),
              )),
        ],
      ),
    ),
  );
}
