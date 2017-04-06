//
//  RMData.swift
//  RMCollectionViewLayout
//
//  Created by 迟浩东 on 2017/4/5.
//  Copyright © 2017年 https://github.com/chihaodong. All rights reserved.
//

import UIKit
import HandyJSON

struct RMData : HandyJSON {

    var name_encoded: String?
    var name: String?
    var gif: Gif?
}


struct Gif : HandyJSON {
    var type: String?
    var id: String?
    var slug: String?
    var url: String?
    var bitly_gif_url: String?
    var bitly_url: String?
    var embed_url: String?
    var username: String?
    var source: String?
    var rating: String?
    var content_url: String?
    var tags: [Tags] = []
    var featured_tags: [Featured_tags] = []
    var source_tld: String?
    var source_post_url: String? 
    var is_hidden: Int?
    var is_removed: Int?
    var is_community: Int?
    var is_anonymous: Int?
    var is_featured: Int?
    var is_realtime: Int?
    var is_indexable: Int?
    var is_sticker: Int?
    var update_datetime: String?
    var create_datetime: String?
    var import_datetime: String?
    var trending_datetime: String?
    var images : Images!

}

struct Tags: HandyJSON {
    
}

struct Featured_tags: HandyJSON {
    
}

struct Images: HandyJSON {
    let fixed_height: Fixed_height? = nil
    let fixed_height_still: fixed_height_still? = nil
    let fixed_height_downsampled: fixed_height_downsampled? = nil
    let fixed_width: fixed_width! = nil
    let fixed_width_still: fixed_width_still? = nil
    let fixed_width_downsampled: fixed_width_downsampled? = nil
    let fixed_height_small: fixed_height_small? = nil
    let fixed_height_small_still: fixed_height_small_still? = nil
    let fixed_width_small: fixed_width_small? = nil
    let fixed_width_small_still: fixed_width_small_still? = nil
    let downsized: downsized? = nil
    let downsized_still: downsized_still? = nil
    let downsized_large: downsized_large? = nil
    let downsized_medium: downsized_medium? = nil
    let original: original? = nil
    let original_still: original_still? = nil
    let looping: looping? = nil
    let preview: preview? = nil
    let downsized_small: downsized_small? = nil
    let preview_gif: preview_gif? = nil
}

struct Fixed_height: HandyJSON {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
    var mp4: String?
    var mp4_size: String?
    var webp_size: String?
}

struct fixed_height_still: HandyJSON {
    var url: String?
    var width: String?
    var height: String?
}

struct fixed_height_downsampled: HandyJSON {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
    var webp: String?
    var webp_size: String?
}

struct fixed_width: HandyJSON {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
    var mp4: String?
    var mp4_size: String?
    var webp: String?
    var webp_size: String?
}

struct fixed_width_still: HandyJSON {
    var url: String?
    var width: String?
    var height: String?
}

struct fixed_width_downsampled: HandyJSON {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
    var webp: String?
    var webp_size: String?
}

struct fixed_height_small: HandyJSON {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
    var mp4: String?
    var mp4_size: String?
    var webp: String?
    var webp_size: String?
}

struct fixed_height_small_still: HandyJSON {
    var url: String?
    var width: String?
    var height: String?
}

struct fixed_width_small: HandyJSON {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
    var mp4: String?
    var mp4_size: String?
    var webp: String?
    var webp_size: String?
}

struct fixed_width_small_still: HandyJSON {
    var url: String?
    var width: String?
    var height: String?
}

struct downsized: HandyJSON {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
}

struct downsized_still: HandyJSON {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
}

struct downsized_large: HandyJSON {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
}

struct downsized_medium: HandyJSON {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
}

struct original: HandyJSON {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
    var frames: String?
    var mp4: String?
    var mp4_size: String?
    var webp: String?
    var webp_size: String?
}

struct original_still: HandyJSON {
    var url: String?
    var width: String?
    var height: String?
}

struct looping: HandyJSON {
    var mp4: String?
}

struct preview: HandyJSON {
    var mp4: String?
    var mp4_size: String?
    var width: String?
    var height: String?
}

struct downsized_small: HandyJSON {
    var mp4: String?
    var mp4_size: String?
    var width: String?
    var height: String?
}

struct preview_gif: HandyJSON {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
}
