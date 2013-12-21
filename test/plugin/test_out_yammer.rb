# coding: utf-8
require 'helper'

class YammerOutputTest < Test::Unit::TestCase
  def setup
    Fluent::Test.setup
  end

  CONFIG = %[
    access_token ACCESS_TOKEN
    group_id GROUP_ID
  ]

  def create_driver(conf = CONFIG, tag = 'test')
    Fluent::Test::OutputTestDriver.new(Fluent::YammerOutput, tag).configure(conf)
  end

  def test_configure
    assert_raise(Fluent::ConfigError){
      d = create_driver('')
    }

    d = create_driver %[
      access_token ACCESS_TOKEN
      group_id GROUP_ID
    ]
    assert_equal 'ACCESS_TOKEN', d.instance.access_token
    assert_equal 'GROUP_ID', d.instance.group_id
  end


  def test_emit
    d1 = create_driver(CONFIG, 'input.access')
    time = Time.parse("2013-12-11 22:33:44").to_i
    d1.run do
      d1.emit({'message' => 'sample message'})
    end
    emits = d1.emits
    assert_equal 0, emits.length
  end
end
