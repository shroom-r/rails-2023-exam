require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "create product and redirect to products index" do
    assert_difference("Product.count") do
      post products_url, params: {
        product: {
          category: 'beverage',
          price: 1.99,
          title: 'Ginger Ale'
        }
      }
    end

    assert_redirected_to products_url
  end

  test "destroy product" do
    product = products(:product_1)
    assert_difference("Product.count", -1) do
      delete product_url(product)
    end

    assert_redirected_to products_url
  end
end
