#!/usr/bin/env ruby
# require 'rubygems'
require 'ruby-jmeter'


test do
     # threads count: 2, rampup: 5, duration: 10 do
    threads count: 2 do
    visit name: 'Baidu Search', url: 'www.baidu.com'
  end
end.flood(ENV['FLOOD_TOKEN'])



#   threads count: 10  do
#   threads count: 10, loops: 5 do
#   threads count: 10, continue_forever: true do
# end.run(gui: true)
# end.flood(ENV['FLOOD_TOKEN'],
#          { name: 'Baidu demo',
#            tag_list: 'Baidu',
#            grid: ENV['FLOOD_GRID']})
