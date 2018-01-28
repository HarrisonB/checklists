Lucky::Server.configure do
  if Lucky::Env.production?
    settings.secret_key_base = secret_key_from_env
  else
    settings.secret_key_base = "gufH1LZ0SQp6fiupxnqQCCeyd4w/h6CSGjo0nUY8+ME="
  end
  settings.host = "0.0.0.0"
  settings.port = (ENV["PORT"]? || 8080).to_i
end

private def secret_key_from_env
  ENV["SECRET_KEY_BASE"]? || raise_missing_secret_key_in_production
end

private def raise_missing_secret_key_in_production
  raise "Please set the SECRET_KEY_BASE environment variable. You can generate a secret key with 'lucky gen.secret_key'"
end
