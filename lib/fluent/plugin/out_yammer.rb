# coding: utf-8
class Fluent::YammerOutput < Fluent::Output
  Fluent::Plugin.register_output('yammer', self)

  config_param :access_token, :string
  config_param :group_id, :string

  def initialize
    super
    require 'yammer'
  end

  def configure(conf)
    super
    @yammer = Yammer::Client.new(access_token: conf['access_token'])
    @group_id = conf['group_id']
  end

  def emit(tag, es, chain)
    es.each do |time, record|
      create_message(record['message'])
    end

    chain.next
  end

  def create_message(message)
    @yammer.create_message(message, group_id: @group_id)
  rescue Yammer::Error => e
    $log.error("Yammer Error: #{e.message}")
  end
end
