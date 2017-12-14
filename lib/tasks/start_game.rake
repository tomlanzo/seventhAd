namespace :start_game do
  desc "TODO"
  task now: :environment do
    `heroku run redis-cli flushdb`
    `heroku run rails db:seed`
  end

  task now_local: :environment do
    `redis-cli flushdb`
    `rails db:seed`
  end

end
