import 'package:freezed_annotation/freezed_annotation.dart';

import '../breeds/breed.dart';
part 'api_response.g.dart';
part 'api_response.freezed.dart';

final s = [
  {
    "breeds": [
      {
        "weight": {"imperial": "6 - 12", "metric": "3 - 7"},
        "id": "beng",
        "name": "Bengal",
        "cfa_url": "http://cfa.org/Breeds/BreedsAB/Bengal.aspx",
        "vetstreet_url": "http://www.vetstreet.com/cats/bengal",
        "vcahospitals_url":
            "https://vcahospitals.com/know-your-pet/cat-breeds/bengal",
        "temperament": "Alert, Agile, Energetic, Demanding, Intelligent",
        "origin": "United States",
        "country_codes": "US",
        "country_code": "US",
        "description":
            "Bengals are a lot of fun to live with, but they're definitely not the cat for everyone, or for first-time cat owners. Extremely intelligent, curious and active, they demand a lot of interaction and woe betide the owner who doesn't provide it.",
        "life_span": "12 - 15",
        "indoor": 0,
        "lap": 0,
        "adaptability": 5,
        "affection_level": 5,
        "child_friendly": 4,
        "cat_friendly": 4,
        "dog_friendly": 5,
        "energy_level": 5,
        "grooming": 1,
        "health_issues": 3,
        "intelligence": 5,
        "shedding_level": 3,
        "social_needs": 5,
        "stranger_friendly": 3,
        "vocalisation": 5,
        "bidability": 3,
        "experimental": 0,
        "hairless": 0,
        "natural": 0,
        "rare": 0,
        "rex": 0,
        "suppressed_tail": 0,
        "short_legs": 0,
        "wikipedia_url": "https://en.wikipedia.org/wiki/Bengal_(cat)",
        "hypoallergenic": 1,
        "reference_image_id": "O3btzLlsO"
      }
    ],
    "id": "aaxNf4D0H",
    "url": "https://cdn2.thecatapi.com/images/aaxNf4D0H.jpg",
    "width": 1080,
    "height": 1350
  }
];

@freezed
class CatImage with _$CatImage{
  @JsonSerializable(explicitToJson: true)
  const factory CatImage({
      @Default([]) List<Breed> breeds,
      required String id,
      required String url,
      required int width,
      required int height}) = _CatImage;

      factory CatImage.fromJson(Map<String,Object?>json) => _$CatImageFromJson(json);
}
