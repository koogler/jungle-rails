require 'rails_helper'

RSpec.feature "Visitor navigates to product details from home page after clicking", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99,
        image: open_asset('apparel1.jpg')
      )
    end
  end

  scenario "They see all products" do
    visit root_path

    # commented out b/c it's for debugging only
    # save_and_open_screenshot
    find('.btn btn-default pull-right').click 

    expect(page).to have_content('Price')
    save_screenshot
  end
  end
end