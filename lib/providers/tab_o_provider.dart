// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class TabOProvider with ChangeNotifier {
  TabOProvider() {
    fetchMetas();
  }
  List<MetaModel> metas = [];
  fetchMetas() async {
    try {
      final data = [
        {
          'gtype': 'T',
          'metaid': '0EfrTPoN6ZP2TxbadytK',
          'gtext': 'response text... textual response.',
          'metatime': '2024-04-19 03:22:22.169000 UTC',
          'metatype': 'G',
          'participant': 'zesty mordant',
          'metatext': null,
          'viewcat': null,
          'metasize': null,
          'rtime': null,
          'dtime': null,
          'metalength': null,
          '__key__': {
            'namespace': '',
            'app': 's~ontxtual',
            'path':
                '\"OntxtView\", \"9Mwedu7gMZXt2P41ikhF\", \"meta\", \"0EfrTPoN6ZP2TxbadytK\"',
            'kind': 'meta',
            'name': '0EfrTPoN6ZP2TxbadytK',
            'id': null
          },
          '__error__': [],
          '__has_error__': 'false'
        },
        {
          'gtype': null,
          'metaid': 'BLUYV7ZOd6dRDpEdAbCR',
          'gtext': null,
          'metatime': '2024-04-19 03:22:22.158000 UTC',
          'metatype': 'VM',
          'participant': 'zesty mordant',
          'metatext': null,
          'viewcat': null,
          'metasize': null,
          'rtime': null,
          'dtime': null,
          'metalength': '30',
          '__key__': {
            'namespace': '',
            'app': 's~ontxtual',
            'path':
                '\"OntxtView\", \"9Mwedu7gMZXt2P41ikhF\", \"meta\", \"BLUYV7ZOd6dRDpEdAbCR\"',
            'kind': 'meta',
            'name': 'BLUYV7ZOd6dRDpEdAbCR',
            'id': null
          },
          '__error__': [],
          '__has_error__': 'false'
        },
        {
          'gtype': null,
          'metaid': 'lETObEj6mNmLXlmJJGzw',
          'gtext': null,
          'metatime': '2024-04-18 16:11:11.416000 UTC',
          'metatype': 'P',
          'participant': 'test two',
          'metatext': 'photo3_21.png',
          'viewcat': {'integer': null, 'string': '4', 'provided': 'string'},
          'metasize': '2500',
          'rtime': null,
          'dtime': null,
          'metalength': null,
          '__key__': {
            'namespace': '',
            'app': 's~ontxtual',
            'path':
                '\"OntxtView\", \"9Mwedu7gMZXt2P41ikhF\", \"meta\", \"lETObEj6mNmLXlmJJGzw\"',
            'kind': 'meta',
            'name': 'lETObEj6mNmLXlmJJGzw',
            'id': null
          },
          '__error__': [],
          '__has_error__': 'false'
        },
        {
          'gtype': null,
          'metaid': 'y60tmsQeR0MSdMChJc1c',
          'gtext': null,
          'metatime': null,
          'metatype': 'V',
          'participant': 'nacho cheese',
          'metatext': 'file.3',
          'viewcat': {'integer': null, 'string': '7', 'provided': 'string'},
          'metasize': '2455',
          'rtime': null,
          'dtime': null,
          'metalength': '33',
          '__key__': {
            'namespace': '',
            'app': 's~ontxtual',
            'path':
                '\"OntxtView\", \"9Mwedu7gMZXt2P41ikhF\", \"meta\", \"y60tmsQeR0MSdMChJc1c\"',
            'kind': 'meta',
            'name': 'y60tmsQeR0MSdMChJc1c',
            'id': null
          },
          '__error__': [],
          '__has_error__': 'false'
        },
        {
          'gtype': null,
          'metaid': 'a855f04a0baa4da58b48b4a37a969423',
          'gtext': null,
          'metatime': '2024-01-25 08:02:02.659000 UTC',
          'metatype': 'F',
          'participant': 'testtest',
          'metatext': 'dat.r.txt',
          'viewcat': {'integer': '3', 'string': null, 'provided': 'integer'},
          'metasize': '1000',
          'rtime': null,
          'dtime': null,
          'metalength': null,
          '__key__': {
            'namespace': '',
            'app': 's~ontxtual',
            'path':
                '\"OntxtView\", \"9Mwedu7gMZXt2P41ikhF\", \"meta\", \"2A75ek0SprKvuDojgnnE\"',
            'kind': 'meta',
            'name': '2A75ek0SprKvuDojgnnE',
            'id': null
          },
          '__error__': [],
          '__has_error__': 'false'
        },
        {
          'gtype': null,
          'metaid': '76XsdZ3DoQfc3EmSmdoU',
          'gtext': null,
          'metatime': null,
          'metatype': 'D',
          'participant': 'zesty mordant',
          'metatext': null,
          'viewcat': {'integer': '8', 'string': null, 'provided': 'integer'},
          'metasize': null,
          'rtime': '',
          'dtime': '2024-05-23 17:34:00.247000 UTC',
          'metalength': null,
          '__key__': {
            'namespace': '',
            'app': 's~ontxtual',
            'path':
                '\"OntxtView\", \"9Mwedu7gMZXt2P41ikhF\", \"meta\", \"76XsdZ3DoQfc3EmSmdoU\"',
            'kind': 'meta',
            'name': '76XsdZ3DoQfc3EmSmdoU',
            'id': null
          },
          '__error__': [],
          '__has_error__': 'false'
        }
      ];
      metas = data.map((e) => MetaModel.fromJson(e)).toList();
      print(metas.length);
      notifyListeners();
    } catch (e) {
      print(e);

      ///
    }
  }
}
