//
//  RMData.swift
//  RMCollectionViewLayout
//
//  Created by 迟浩东 on 2017/4/5.
//  Copyright © 2017年 https://github.com/chihaodong. All rights reserved.
//

import UIKit

class RMData: NSObject {

    var name_encoded: String?
    var name: String?
    var gif: Gif?
}


class Gif: NSObject {
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
    var tags: [String]?
    var featured_tags: [String]?
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

class Images: NSObject {
    var fixed_height: Fixed_height?
    var fixed_height_still: fixed_height_still?
    var fixed_height_downsampled: fixed_height_downsampled?
    var fixed_width: fixed_width!
    var fixed_width_still: fixed_width_still?
    var fixed_width_downsampled: fixed_width_downsampled?
    var fixed_height_small: fixed_height_small?
    var fixed_height_small_still: fixed_height_small_still?
    var fixed_width_small: fixed_width_small?
    var fixed_width_small_still: fixed_width_small_still?
    var downsized: downsized?
    var downsized_still: downsized_still?
    var downsized_large: downsized_large?
    var downsized_medium: downsized_medium?
    var original: original?
    var original_still: original_still?
    var looping: looping?
    var preview: preview?
    var downsized_small: downsized_small?
    var preview_gif: preview_gif?
}

class Fixed_height: NSObject {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
    var mp4: String?
    var mp4_size: String?
    var webp_size: String?
}

class fixed_height_still: NSObject {
    var url: String?
    var width: String?
    var height: String?
}

class fixed_height_downsampled: NSObject {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
    var webp: String?
    var webp_size: String?
}

class fixed_width: NSObject {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
    var mp4: String?
    var mp4_size: String?
    var webp: String?
    var webp_size: String?
}

class fixed_width_still: NSObject {
    var url: String?
    var width: String?
    var height: String?
}

class fixed_width_downsampled: NSObject {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
    var webp: String?
    var webp_size: String?
}

class fixed_height_small: NSObject {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
    var mp4: String?
    var mp4_size: String?
    var webp: String?
    var webp_size: String?
}

class fixed_height_small_still: NSObject {
    var url: String?
    var width: String?
    var height: String?
}

class fixed_width_small: NSObject {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
    var mp4: String?
    var mp4_size: String?
    var webp: String?
    var webp_size: String?
}

class fixed_width_small_still: NSObject {
    var url: String?
    var width: String?
    var height: String?
}

class downsized: NSObject {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
}

class downsized_still: NSObject {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
}

class downsized_large: NSObject {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
}

class downsized_medium: NSObject {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
}

class original: NSObject {
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

class original_still: NSObject {
    var url: String?
    var width: String?
    var height: String?
}

class looping: NSObject {
    var mp4: String?
}

class preview: NSObject {
    var mp4: String?
    var mp4_size: String?
    var width: String?
    var height: String?
}

class downsized_small: NSObject {
    var mp4: String?
    var mp4_size: String?
    var width: String?
    var height: String?
}

class preview_gif: NSObject {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
}
