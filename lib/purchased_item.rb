class PurchasedItem
  $tax_exempt_items = [
    "book", "pill", "chocolate", "rice", "capsule"
  ]
  attr_reader :quantity, :product_name, :original_price, :taxes, :total_price, :is_imported, :pay_taxes
  
  def initialize(quantity, product_name, original_price)
    @quantity = quantity.to_i
    @product_name = product_name
    @original_price = original_price.to_f
    @pay_taxes = is_taxes_excempt(product_name)
    @is_imported = product_name.include? "imported"
    @taxes = calculate_taxes(@pay_taxes, @is_imported, @original_price)
    # this is also an option and i wont need to store the pay_taxes, and is_imported values, but it look bit harder to read 
    #@taxes = calculate_taxes(is_taxes_excempt(product_name), product_name.include? "imported")
    @total_price = (@original_price+taxes).round(2)
  end

  def is_taxes_excempt(product_name)
    pay_taxes = true
    $tax_exempt_items.each do |item|
      if product_name.include? item
        pay_taxes = false;
      end
    end
    return pay_taxes
  end

  def calculate_taxes(pay_taxes, is_imported, original_price)
    imported_tax = 0
    basic_tax = 0
    if (is_imported)
      imported_tax = (original_price * 0.05).round(1) 
    end
    if (pay_taxes)
      basic_tax = (original_price * 0.1).round(2)
    end
    return (imported_tax+basic_tax).round(2)
  end

end