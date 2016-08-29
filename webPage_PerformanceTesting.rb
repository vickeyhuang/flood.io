#!/usr/bin/env ruby

require 'ruby-jmeter'

test do

  defaults domain: 'domainName',
      image_parser: false,
      protocol: 'http'

  # cookies clear: false,
  #         implementation: 'org.apache.jmeter.protocol.http.control.HC4CookieHandler'

  with_user_agent :chrome

  header [
             {name: 'Accept-Encoding', value: 'gzip,deflate,sdch'},
      {name: 'Accept', value: 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8'}
  ]

  threads count: 800, rampup: 1200, :duration =>1800   do

  random_timer 2_000, 2_000

  simple_controller name: 'Get the homepage' do
  get name: 'LandingPage', url: '/find-agents/faa'
end


  simple_controller name: 'WebPage Stress testing' do
  csv_data_set_config filename: 'testData.csv', variableNames: 'parameter'
  get name: 'WebpageTesting', url: '/xxx/xxx/${parameter}'
end
  view_results_tree

end

# end.flood(ENV['FLOOD_TOKEN'], {
#                                     files: ["#{Dir.pwd}/testData.csv"],
#                                     name: 'WEB-StressTesting-800Users-LoadingTime-30m',
#                                     tag_list: '',
#                                     privacy: 'public',
#                                     grid: ENV['FLOOD_GRID']})


end.run(gui: true)