class ProductDetails {
  int? status;
  String? message;
  Data? data;

  ProductDetails({this.status, this.message, this.data});

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
    status: json['status'],
    message: json['message'],
    data: json['data'] != null ? Data.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    if (data != null) 'data': data!.toJson(),
  };
}

class Data {
  String? id;
  String? sku;
  int? isReturn;
  int? celebrityId;
  String? name;
  String? attributeSetId;
  String? price;
  String? finalPrice;
  String? status;
  String? type;
  String? webUrl;
  String? brandName;
  String? brand;
  int? isFollowingBrand;
  String? brandBannerUrl;
  bool? isSalable;
  int? isNew;
  int? isSale;
  int? isTrending;
  int? isBestSeller;
  String? image;
  String? createdAt;
  String? updatedAt;
  dynamic weight;
  String? description;
  String? shortDescription;
  String? howToUse;
  String? manufacturer;
  String? keyIngredients;
  String? returnsAndExchanges;
  String? shippingAndDelivery;
  String? aboutTheBrand;
  String? metaTitle;
  String? metaKeyword;
  String? metaDescription;
  String? sizeChart;
  int? wishlistItemId;
  String? hasOptions;
  List<dynamic>? options;
  List<dynamic>? bundleOptions;
  List<ConfigurableOption>? configurableOption;
  int? remainingQty;
  List<String>? images;
  List<dynamic>? upsell;
  List<dynamic>? related;
  Review? review;

  Data({
    this.id,
    this.sku,
    this.isReturn,
    this.celebrityId,
    this.name,
    this.attributeSetId,
    this.price,
    this.finalPrice,
    this.status,
    this.type,
    this.webUrl,
    this.brandName,
    this.brand,
    this.isFollowingBrand,
    this.brandBannerUrl,
    this.isSalable,
    this.isNew,
    this.isSale,
    this.isTrending,
    this.isBestSeller,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.weight,
    this.description,
    this.shortDescription,
    this.howToUse,
    this.manufacturer,
    this.keyIngredients,
    this.returnsAndExchanges,
    this.shippingAndDelivery,
    this.aboutTheBrand,
    this.metaTitle,
    this.metaKeyword,
    this.metaDescription,
    this.sizeChart,
    this.wishlistItemId,
    this.hasOptions,
    this.options,
    this.bundleOptions,
    this.configurableOption,
    this.remainingQty,
    this.images,
    this.upsell,
    this.related,
    this.review,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json['id'],
    sku: json['sku'],
    isReturn: json['is_return'],
    celebrityId: json['celebrity_id'],
    name: json['name'],
    attributeSetId: json['attribute_set_id'],
    price: json['price'],
    finalPrice: json['final_price'],
    status: json['status'],
    type: json['type'],
    webUrl: json['web_url'],
    brandName: json['brand_name'],
    brand: json['brand'],
    isFollowingBrand: json['is_following_brand'],
    brandBannerUrl: json['brand_banner_url'],
    isSalable: json['is_salable'],
    isNew: json['is_new'],
    isSale: json['is_sale'],
    isTrending: json['is_trending'],
    isBestSeller: json['is_best_seller'],
    image: json['image'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    weight: json['weight'],
    description: json['description'],
    shortDescription: json['short_description'],
    howToUse: json['how_to_use'],
    manufacturer: json['manufacturer'],
    keyIngredients: json['key_ingredients'],
    returnsAndExchanges: json['returns_and_exchanges'],
    shippingAndDelivery: json['shipping_and_delivery'],
    aboutTheBrand: json['about_the_brand'],
    metaTitle: json['meta_title'],
    metaKeyword: json['meta_keyword'],
    metaDescription: json['meta_description'],
    sizeChart: json['size_chart'],
    wishlistItemId: json['wishlist_item_id'],
    hasOptions: json['has_options'],
    options: json['options'] ?? [],
    bundleOptions: json['bundle_options'] ?? [],
    configurableOption: json['configurable_option'] != null
        ? List<ConfigurableOption>.from(
        json['configurable_option']
            .map((x) => ConfigurableOption.fromJson(x)))
        : [],
    remainingQty: json['remaining_qty'],
    images: json['images'] != null
        ? List<String>.from(json['images'])
        : [],
    upsell: json['upsell'] ?? [],
    related: json['related'] ?? [],
    review: json['review'] != null ? Review.fromJson(json['review']) : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'sku': sku,
    'is_return': isReturn,
    'celebrity_id': celebrityId,
    'name': name,
    'attribute_set_id': attributeSetId,
    'price': price,
    'final_price': finalPrice,
    'status': status,
    'type': type,
    'web_url': webUrl,
    'brand_name': brandName,
    'brand': brand,
    'is_following_brand': isFollowingBrand,
    'brand_banner_url': brandBannerUrl,
    'is_salable': isSalable,
    'is_new': isNew,
    'is_sale': isSale,
    'is_trending': isTrending,
    'is_best_seller': isBestSeller,
    'image': image,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'weight': weight,
    'description': description,
    'short_description': shortDescription,
    'how_to_use': howToUse,
    'manufacturer': manufacturer,
    'key_ingredients': keyIngredients,
    'returns_and_exchanges': returnsAndExchanges,
    'shipping_and_delivery': shippingAndDelivery,
    'about_the_brand': aboutTheBrand,
    'meta_title': metaTitle,
    'meta_keyword': metaKeyword,
    'meta_description': metaDescription,
    'size_chart': sizeChart,
    'wishlist_item_id': wishlistItemId,
    'has_options': hasOptions,
    'options': options,
    'bundle_options': bundleOptions,
    'configurable_option':
    configurableOption?.map((x) => x.toJson()).toList(),
    'remaining_qty': remainingQty,
    'images': images,
    'upsell': upsell,
    'related': related,
    'review': review?.toJson(),
  };
}

class ConfigurableOption {
  int? attributeId;
  String? type;
  String? attributeCode;
  List<Attributes>? attributes;

  ConfigurableOption({this.attributeId, this.type, this.attributeCode, this.attributes});

  factory ConfigurableOption.fromJson(Map<String, dynamic> json) => ConfigurableOption(
    attributeId: json['attribute_id'],
    type: json['type'],
    attributeCode: json['attribute_code'],
    attributes: json['attributes'] != null
        ? List<Attributes>.from(
        json['attributes'].map((x) => Attributes.fromJson(x)))
        : [],
  );

  Map<String, dynamic> toJson() => {
    'attribute_id': attributeId,
    'type': type,
    'attribute_code': attributeCode,
    'attributes': attributes?.map((x) => x.toJson()).toList(),
  };
}

class Attributes {
  String? value;
  String? optionId;
  String? attributeImageUrl;
  String? price;
  List<String>? images;
  dynamic colorCode;
  String? swatchUrl;

  Attributes({
    this.value,
    this.optionId,
    this.attributeImageUrl,
    this.price,
    this.images,
    this.colorCode,
    this.swatchUrl,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    value: json['value'],
    optionId: json['option_id'],
    attributeImageUrl: json['attribute_image_url'],
    price: json['price'],
    images: json['images'] != null ? List<String>.from(json['images']) : [],
    colorCode: json['color_code'],
    swatchUrl: json['swatch_url'],
  );

  Map<String, dynamic> toJson() => {
    'value': value,
    'option_id': optionId,
    'attribute_image_url': attributeImageUrl,
    'price': price,
    'images': images,
    'color_code': colorCode,
    'swatch_url': swatchUrl,
  };
}

class Review {
  int? totalReview;
  int? ratingCount;

  Review({this.totalReview, this.ratingCount});

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    totalReview: json['total_review'],
    ratingCount: json['rating_count'],
  );

  Map<String, dynamic> toJson() => {
    'total_review': totalReview,
    'rating_count': ratingCount,
  };
}
