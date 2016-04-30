require 'ember_cli_deploy/version'
require 'redis'

module EmberCliDeploy
  class Index
    attr_reader :namespace, :redis

    def initialize(namespace, redis_url)
      @namespace = "#{namespace}:index"
      @redis = Redis.new(url: redis_url)
    end

    def revisions
      redis.zrevrange("#{namespace}:revisions", 0, -1)
    end

    def latest
      revisions.first
    end

    def active
      redis.get("#{namespace}:current")
    end

    def activate(version)
      redis.set("#{namespace}:current", version)
    end

    def deactivate
      redis.del("#{namespace}:current")
    end

    def html(version = nil)
      version = active if version.blank?
      version = latest if version == 'latest'
      redis.get("#{namespace}:#{version}")
    end
  end
end
