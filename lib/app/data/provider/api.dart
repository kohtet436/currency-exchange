import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

enum RequestType { GET, POST, DELETE }

class RequestTypeNotFoundException implements Exception {
  String cause;
  RequestTypeNotFoundException(this.cause);
}



class APIService {
  final String _baseURL = "forex.cbm.gov.mm";

  Future<Response> request(
      {required RequestType requestType,
      required String path,
      dynamic parameter,
      Map<String, String>? header,
      dynamic body}) async {
    switch (requestType) {
      case RequestType.GET:
        return http
            .get(Uri.https(_baseURL, path, parameter), headers: header)
            .timeout(
         const Duration(seconds: 10),
          onTimeout: () {
            // Time has run out, do what you wanted to do.
            return http.Response('{"error": "Time out error"}',
                500); // Replace 500 with your http code.
          },
        );
        break;
      case RequestType.POST:
        return http
            .post(Uri.https(_baseURL, path, parameter),
                headers: header, body: body)
            .timeout(
          Duration(seconds: 10),
          onTimeout: () {
            // Time has run out, do what you wanted to do.
            return http.Response('{"error": "Time out error"}',
                500); // Replace 500 with your http code.
          },
        );
        break;

      case RequestType.DELETE:
        return http.delete(Uri.https(_baseURL, path), headers: header).timeout(
          Duration(seconds: 10),
          onTimeout: () {
            // Time has run out, do what you wanted to do.
            return http.Response('{"error": "Time out error"}',
                500); // Replace 500 with your http code.
          },
        );
      default:
        return throw RequestTypeNotFoundException(
            "The HTTP request mentioned is not found");
    }
  }
}
