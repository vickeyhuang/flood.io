#!/usr/bin/env ruby

require 'ruby-jmeter'

test do

  defaults domain: 'domainName',
      image_parser: false,
      protocol: 'https'

  # cookies clear: false,
  #         implementation: 'org.apache.jmeter.protocol.http.control.HC4CookieHandler'

  with_user_agent :chrome

  header [
             {name: 'Accept-Encoding', value: 'gzip,deflate,sdch'},
      {name: 'Accept', value: 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8'}
  ]

  threads count: 400, rampup: 3600, :duration => 7200  do

  random_timer 2_000, 2_000


  simple_controller name: 'API Testing' do
  csv_data_set_config filename: 'testData.csv', variableNames: 'parameter'
  get name: 'Title', url: '/xxx/xxx/${parameter}'
end
  view_results_tree

end

# end.flood(ENV['FLOOD_TOKEN'], {
#                                     files: ["#{Dir.pwd}/testData.csv"],
#                                     name: 'API-Test-400Users-LoadingTime-1h',
#                                     tag_list: '',
#                                     privacy: 'public',
#                                     grid: ENV['FLOOD_GRID']})

end.run(gui: true)