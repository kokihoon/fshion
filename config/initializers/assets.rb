# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( hotel.css )
Rails.application.config.assets.precompile += %w( attract.css )
Rails.application.config.assets.precompile += %w( detailed_content.css )
Rails.application.config.assets.precompile += %w( check.css )
Rails.application.config.assets.precompile += %w( my_page.css )
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.scss, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
