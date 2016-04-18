::CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = "Ug_4CTFLN62OJYmTmwZRyVan42Z9rQu8H7SQelzB"
  config.qiniu_secret_key    = 'Cftq1ZncgF4Le69YPVdbYvdlc85E8zZZawdzxDWb'
  config.qiniu_bucket        = "lisiur"
  config.qiniu_bucket_domain = "7xpgjt.com1.z0.glb.clouddn.com"
  config.qiniu_protocol      = "http"
end
