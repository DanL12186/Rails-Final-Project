Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'] #"1685844028387486"], "e83296721bcbbef0d3ad02dcc674e6a9"]
end
