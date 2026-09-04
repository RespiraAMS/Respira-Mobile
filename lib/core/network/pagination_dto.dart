/// DTOs mirroring `Respira.ServiceDefaults.Dtos.Pagination*`.
library;

/// Paged list item wrapper returned by all list endpoints.
class Paged<T> {
  Paged({required this.metadata, required this.items});

  factory Paged.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromItem,
  ) {
    final rawItems = json['items'] as List<dynamic>? ?? [];
    return Paged(
      metadata: PaginationMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>? ?? {},
      ),
      items: rawItems.map((e) => fromItem(e as Map<String, dynamic>)).toList(),
    );
  }

  final PaginationMetadata metadata;
  final List<T> items;
}

class PaginationMetadata {
  const PaginationMetadata({
    required this.hasNextPage,
    required this.hasPreviousPage,
    required this.totalItemCount,
    required this.pageCount,
    required this.currentPage,
    required this.pageSize,
  });

  factory PaginationMetadata.fromJson(Map<String, dynamic> json) {
    return PaginationMetadata(
      hasNextPage: (json['hasNextPage'] as bool?) ?? false,
      hasPreviousPage: (json['hasPreviousPage'] as bool?) ?? false,
      totalItemCount: (json['totalItemCount'] as num?)?.toInt() ?? 0,
      pageCount: (json['pageCount'] as num?)?.toInt() ?? 0,
      currentPage: (json['currentPage'] as num?)?.toInt() ?? 1,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 10,
    );
  }

  final bool hasNextPage;
  final bool hasPreviousPage;
  final int totalItemCount;
  final int pageCount;
  final int currentPage;
  final int pageSize;
}
