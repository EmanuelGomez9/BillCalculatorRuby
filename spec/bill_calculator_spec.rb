require "bill_calculator"

test_data = [
  "2 book at 12.49\n1 music CD at 14.99\n1 chocolate bar at 0.85",
  "1 imported box of chocolates at 10.00\n1 imported bottle of perfume at 47.50",
  "1 imported bottle of perfume at 27.99\n1 bottle of perfume at 18.99\n1 packet of headache pills at 9.75\n3 imported box of chocolates at 11.25"
]
expected_responses = [
  "2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32",
  "1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15",
  "1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported box of chocolates: 35.55
Sales Taxes: 7.90
Total: 98.38"
]
bills = []

describe BillCalculator do

  describe '#create_bill' do
    context "given test data case information" do
      test_data.each_with_index do |test, i|
        it "returns expected response" do
          bills.push(BillCalculator.new(test))
          expect(bills[i].create_bill()).to eq(expected_responses[i])
        end
      end
    end
  end

end