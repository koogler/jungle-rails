require 'rails_helper'

RSpec.feature "Top right card updates when visitor adds an item to their cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do
    visit root_path

    # commented out b/c it's for debugging only
    # save_and_open_screenshot
    find('.button_to').click 
    save_screenshot

    expect(page).to have_content 'My Cart (1)'
  end
  end
end