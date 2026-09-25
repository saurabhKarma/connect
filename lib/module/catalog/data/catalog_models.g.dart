// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CatalogStore _$CatalogStoreFromJson(Map<String, dynamic> json) =>
    _CatalogStore(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      tagline: json['tagline'] as String?,
      logoUrl: json['logoUrl'] as String?,
      productCount: (json['productCount'] as num?)?.toInt() ?? 0,
      status: json['status'] as String? ?? 'ACTIVE',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CatalogStoreToJson(_CatalogStore instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'tagline': instance.tagline,
      'logoUrl': instance.logoUrl,
      'productCount': instance.productCount,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  currency: json['currency'] as String? ?? 'INR',
  availability: json['availability'] as String? ?? 'IN_STOCK',
  sku: json['sku'] as String?,
  status: json['status'] as String? ?? 'ACTIVE',
  imageUrls:
      (json['imageUrls'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'currency': instance.currency,
  'availability': instance.availability,
  'sku': instance.sku,
  'status': instance.status,
  'imageUrls': instance.imageUrls,
  'createdAt': instance.createdAt?.toIso8601String(),
};

_ProductPage _$ProductPageFromJson(Map<String, dynamic> json) => _ProductPage(
  content:
      (json['content'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Product>[],
  page: (json['page'] as num?)?.toInt() ?? 0,
  size: (json['size'] as num?)?.toInt() ?? 0,
  totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ProductPageToJson(_ProductPage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'page': instance.page,
      'size': instance.size,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
    };

_PublicStore _$PublicStoreFromJson(Map<String, dynamic> json) => _PublicStore(
  id: json['id'] as String,
  name: json['name'] as String,
  category: json['category'] as String,
  tagline: json['tagline'] as String?,
  logoUrl: json['logoUrl'] as String?,
  productCount: (json['productCount'] as num?)?.toInt() ?? 0,
  ownerUserId: json['ownerUserId'] as String,
  ownerName: json['ownerName'] as String?,
);

Map<String, dynamic> _$PublicStoreToJson(_PublicStore instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'tagline': instance.tagline,
      'logoUrl': instance.logoUrl,
      'productCount': instance.productCount,
      'ownerUserId': instance.ownerUserId,
      'ownerName': instance.ownerName,
    };

_PublicProduct _$PublicProductFromJson(Map<String, dynamic> json) =>
    _PublicProduct(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      currency: json['currency'] as String? ?? 'INR',
      availability: json['availability'] as String? ?? 'IN_STOCK',
      imageUrls:
          (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      catalogId: json['catalogId'] as String,
      storeName: json['storeName'] as String?,
      ownerUserId: json['ownerUserId'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$PublicProductToJson(_PublicProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'currency': instance.currency,
      'availability': instance.availability,
      'imageUrls': instance.imageUrls,
      'catalogId': instance.catalogId,
      'storeName': instance.storeName,
      'ownerUserId': instance.ownerUserId,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_PublicProductPage _$PublicProductPageFromJson(Map<String, dynamic> json) =>
    _PublicProductPage(
      content:
          (json['content'] as List<dynamic>?)
              ?.map((e) => PublicProduct.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PublicProduct>[],
      page: (json['page'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 0,
      totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PublicProductPageToJson(_PublicProductPage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'page': instance.page,
      'size': instance.size,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
    };
