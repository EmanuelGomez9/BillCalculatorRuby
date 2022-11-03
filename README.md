# BillCalculatorRuby

Bill and taxes calculator using ruby and rspec

versions:

- ruby 3.1.2p20

Instructions:

- Install Ruby
- Open project folder and run "bundle install"

- To run test cases run "bundle exec rspec"

- To try yourself run "irb"
  Inside irb you will need to run 'require_relative "lib/bill_calculator"'
  Then create a bill like 'bill = BillCalculator.new("2 book at 12.49\n1 music CD at 14.99\n1 chocolate bar at 0.85")'
  Then use "bill.create_bill()" and see the response.
