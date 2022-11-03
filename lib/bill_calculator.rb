require_relative "purchased_item"

class BillCalculator
  attr_reader :purchased_items

  def initialize(item_list)
    @purchased_items = get_items_information(separate_items(item_list))
  end

  def separate_items(item_list)
    return item_list.split("\n")
  end

  def get_items_information(items)
    purchased_items = []
    items.each do |item|
      splited_item = item.split(" ")
      splited_name = splited_item[1..-3]
      product_name = splited_name.join(" ")
      purchased_items.push(PurchasedItem.new(splited_item.first, product_name, splited_item.last))
    end
    return purchased_items
  end

  def create_bill()
    response_string = String.new()
    total_taxes = 0;
    total = 0;
    @purchased_items.each do |item|
      items_total_price = item.quantity*item.total_price
      item_as_array = [item.quantity, item.product_name.concat(":"), '%.2f' % items_total_price]
      item_as_string = item_as_array.join(" ")
      response_string += item_as_string + "\n"
      total_taxes+= (item.taxes*item.quantity)
      total+= items_total_price
    end
    response_string += 'Sales Taxes: %.2f' % total_taxes.round(2) + "\n"
    response_string += 'Total: %.2f' % total.round(2)
    return response_string
  end

end