require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  def products_title
    all('.product .title').map(&:text)
  end

  test "list only non-archived products in index and archived ones separately" do #TODO
    archived_title = products(:product_archived).title

    visit products_path # /products
    refute_includes products_title, archived_title

    visit archived_products_path # /archives
    assert_equal [archived_title], products_title
  end

  test "list only discounted products" do #TODO
    visit discounted_products_path

    assert_equal "/discounts", current_path

    discounted_titles = Product.discounted.map(&:title)
    assert_equal discounted_titles.sort, products_title.sort
  end

  test "update product description (text area)" do #OK
    product = products(:product_1)
    new_description = "It's the best product!"

    visit product_url(product)
    click_on "Edit this product"

    fill_in "Description", with: new_description
    click_on "Update Product"

    assert_text "Product was successfully updated"

    assert_text new_description
    assert_equal new_description, product.reload.description
  end

  def price_html
    find('li.price').native.inner_html.strip
  end

  test "highlight discounted price wiht mark tag and append 💥 after the price" do #TODO
    product = products(:product_3)

    visit product_url(product)
    assert_match %r{\ACHF \d+.\d+\z}, price_html

    product.update!(discounted: true)
    visit product_url(product)
    assert_match %r{\A<mark>CHF \d+.\d+ 💥</mark>\z}, price_html
  end

  test "hide archive button when product is archived" do #ok
    product = products(:product_1)

    visit product_url(product)

    assert_button "Archive"
    assert_difference("Product.archived.count") do
      click_button "Archive"
    end

    visit product_url(product)
    assert_text "ARCHIVED"
    refute_button "Archive"
  end

  def products_counter
    find('#products .counter').text
  end

  test "show the numbers of products at the bottom of the index page" do #ok
    visit products_by_category_path('beverage')
    assert_equal "3 products", products_counter

    Product.where(category: 'beverage').limit(2).delete_all

    visit products_by_category_path('beverage')
    assert_equal "1 product", products_counter
  end
end
