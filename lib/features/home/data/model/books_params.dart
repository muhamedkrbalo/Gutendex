class BooksParams {
  final int pageNumber;
  final String? search;

  BooksParams({required this.pageNumber, this.search});

  Map<String, dynamic> toJson() => {
        'page': pageNumber,
        if (search != null && search!.isNotEmpty) 'search': search
      };
}
