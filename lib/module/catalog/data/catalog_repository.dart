import 'package:connect/exception/api_exception.dart';
import 'package:connect/module/catalog/data/catalog_models.dart';
import 'package:connect/network/api_controller.dart';
import 'package:connect/network/end_points.dart';

/// Catalog API: the caller's store + products, and public browse.
class CatalogRepository {
  final ApiController _api = ApiController.instance;

  // ---- My store ----

  /// My store, or null if I haven't set one up yet (backend returns 404).
  Future<CatalogStore?> myStore() async {
    try {
      final res = await _api.get(EndPoints.CATALOG_ME);
      return CatalogStore.fromJson(res.data as Map<String, dynamic>);
    } on ApiException catch (e) {
      if (e.statusCode == 404) return null;
      rethrow;
    }
  }

  Future<CatalogStore> createStore({
    required String name,
    required String category,
    String? tagline,
    String? logoUrl,
  }) async {
    final res = await _api.post(EndPoints.CATALOG, body: {
      'name': name,
      'category': category,
      if (tagline != null && tagline.isNotEmpty) 'tagline': tagline,
      if (logoUrl != null && logoUrl.isNotEmpty) 'logoUrl': logoUrl,
    });
    return CatalogStore.fromJson(res.data as Map<String, dynamic>);
  }

  Future<CatalogStore> updateStore({
    String? name,
    String? category,
    String? tagline,
    String? logoUrl,
  }) async {
    final res = await _api.patch(EndPoints.CATALOG_ME, body: {
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (tagline != null) 'tagline': tagline,
      if (logoUrl != null) 'logoUrl': logoUrl,
    });
    return CatalogStore.fromJson(res.data as Map<String, dynamic>);
  }

  // ---- My products ----

  Future<ProductPage> myProducts({int page = 0, int size = 50}) async {
    final res = await _api.get(EndPoints.CATALOG_PRODUCTS, queryParameters: {'page': page, 'size': size});
    return ProductPage.fromJson(res.data as Map<String, dynamic>);
  }

  Future<Product> productDetail(String id) async {
    final res = await _api.get(EndPoints.catalogProduct(id));
    return Product.fromJson(res.data as Map<String, dynamic>);
  }

  Future<Product> addProduct({
    required String name,
    String? description,
    double? price,
    String? currency,
    String availability = 'IN_STOCK',
    String? sku,
    List<String> imageUrls = const [],
  }) async {
    final res = await _api.post(EndPoints.CATALOG_PRODUCTS, body: {
      'name': name,
      if (description != null && description.isNotEmpty) 'description': description,
      if (price != null) 'price': price,
      if (currency != null) 'currency': currency,
      'availability': availability,
      if (sku != null && sku.isNotEmpty) 'sku': sku,
      'imageUrls': imageUrls,
    });
    return Product.fromJson(res.data as Map<String, dynamic>);
  }

  /// Edit a product. Only pass the fields you want to change; imageUrls (if non-null) replaces all.
  Future<Product> updateProduct(
    String id, {
    String? name,
    String? description,
    double? price,
    String? availability,
    String? sku,
    String? status,
    List<String>? imageUrls,
  }) async {
    final res = await _api.patch(EndPoints.catalogProduct(id), body: {
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (price != null) 'price': price,
      if (availability != null) 'availability': availability,
      if (sku != null) 'sku': sku,
      if (status != null) 'status': status,
      if (imageUrls != null) 'imageUrls': imageUrls,
    });
    return Product.fromJson(res.data as Map<String, dynamic>);
  }

  Future<void> deleteProduct(String id) async {
    await _api.delete(EndPoints.catalogProduct(id));
  }

  // ---- Public browse ----

  Future<PublicStore> publicStore(String catalogId) async {
    final res = await _api.get(EndPoints.publicCatalog(catalogId));
    return PublicStore.fromJson(res.data as Map<String, dynamic>);
  }

  /// A user's store, or null if they don't have one (backend returns 404).
  Future<PublicStore?> storeByUser(String userId) async {
    try {
      final res = await _api.get(EndPoints.userCatalog(userId));
      return PublicStore.fromJson(res.data as Map<String, dynamic>);
    } on ApiException catch (e) {
      if (e.statusCode == 404) return null;
      rethrow;
    }
  }

  Future<PublicProductPage> publicProducts(String catalogId, {int page = 0, int size = 50}) async {
    final res = await _api.get(EndPoints.publicCatalogProducts(catalogId),
        queryParameters: {'page': page, 'size': size});
    return PublicProductPage.fromJson(res.data as Map<String, dynamic>);
  }

  Future<PublicProduct> publicProduct(String productId) async {
    final res = await _api.get(EndPoints.publicProduct(productId));
    return PublicProduct.fromJson(res.data as Map<String, dynamic>);
  }
}
