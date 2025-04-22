import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_basics/domain/album.dart';
import 'package:flutter_test_basics/fetcher.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'fetcher_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchAlbum', () {
    test('Album이 정상적으로 반환되어야 한다', () {
      final client = MockClient();
      final fetcher = Fetcher(client: client);

      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response(
              '{"userId": 1, "id": 1, "title": "test"}',
              200,
            ),
          );

      expect(fetcher.fetchAlbum(), isA<Album>());
    });

    test('404 에러인 경우예는 예외를 발생시켜야 한다', () {
      final client = MockClient();
      final fetcher = Fetcher(client: client);

      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response(
              'Not Found',
              404,
            ),
          );

      expect(fetcher.fetchAlbum(), throwsException);
    });
  });
}
