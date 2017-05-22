Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_KEY="1685844028387486", FACEBOOK_SECRET="e83296721bcbbef0d3ad02dcc674e6a9"
end
