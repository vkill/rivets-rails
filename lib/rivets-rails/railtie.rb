module Rivets
  module Rails
    class Railtie < ::Rails::Railtie

      initializer "sprockets.rivets-rails", after: "append_asset_paths", group: :all do |app|
        next unless app.config.assets.enabled
        path = File.expand_path("../../../dist", __FILE__)
        app.config.assets.paths << path unless app.config.assets.paths.include?(path)
      end

    end
  end
end

