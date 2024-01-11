require "test_helper"

class ProductTest < ActiveSupport::TestCase
 test "validate title is unique" do #OK
    existing_title = products(:product_1).title
    product = Product.new(title: existing_title)

    refute product.valid?
    assert_includes product.errors[:title], 'has already been taken'
  end

  test "active scope only return non-archived products" do #ok
    Product.find_each(&:archive!)
    assert_equal 0, Product.active.count

    Product.update_all(archived_at: nil)
    assert_equal Product.count, Product.active.count
  end

  # https://ruby-doc.org/3.2.2/Float.html#method-i-round
  test "discount price by 20% (round to 2 decimals)" do #ok
    product = Product.new(price: 100)
    assert_equal 80.00, product.discounted_price

    product = Product.new(price: 99.99)
    assert_equal 79.99, product.discounted_price
  end
end
