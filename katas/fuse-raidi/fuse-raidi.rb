# encoding: UTF-8

# TOUT DOUX:
#
# * ~~cd /mnt/redis => On se connecte au serveur Redis
# * ~~ls => exécute KEYS *
# * echo "hello world" > foo => SET foo "hello world"
# * ~~cat foo => GET foo
# * mkdir bar => NOOP

require "rfusefs"
require "redis"

class FuseRaidi

  def initialize
    @redis = Redis.new
  end

  def contents(path)
    @redis.keys('*').select {|k| @redis.type(k) == 'string' }
  end

  def write_to(path, body)
    @redis.set redify(path), body
  end

  def can_write?(path)
    true
  end

  def delete(path)
    @redis.del redify(path)
  end

  def can_delete?(path)
    true
  end

  def read_file(path)
    @redis.get redify(path)
  end

  def size(path)
    @redis.strlen redify(path)
  end

  def file?(path)
    @redis.exists redify(path)
  end

  private

  def redify(path)
    path[1..-1]
  end
end

FuseFS.start(FuseRaidi.new, *ARGV)
