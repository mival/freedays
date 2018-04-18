require "cloudinary"
require "shrine/storage/cloudinary"

Cloudinary.config(
    cloud_name: "none123",
    api_key:    "429443897873934",
    api_secret: "UuXewNiAVx_aYpj9PWy37zPCYzs",
    )

Shrine.storages = {
    cache: Shrine::Storage::Cloudinary.new(prefix: "cache", resource_type: "raw"), # for direct uploads
    store: Shrine::Storage::Cloudinary.new(prefix: "store", resource_type: "raw"),
}