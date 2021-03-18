
namespace :user do
  desc "Rebuild Auth-Tokens"
  task :rebuild_auth_token => :environment do
    User.transaction do
      User.all.each { |u|
        u.update_attribute :auth_token, SecureRandom.urlsafe_base64
      }
    end
  end
end