require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save successfully when all four fields are set' do
      @product = Product.create
      @category = Category.create
      @product.name = 'Foo'
      @product.price_cents = 15
      @product.quantity = 5
      @category.name = 'Bar'
      @product.category = @category
      expect(@product.valid?).to be true
    end

    it 'should fail to save when name isnt set' do
      @product = Product.new
      @product.name = nil
      @product.valid?
      expect(@product.errors[:name]).to include ("can't be blank")
    end

    it 'should fail to save when price isnt set' do
      @product = Product.new
      @product.price_cents = nil
      @product.valid?
      expect(@product.errors[:price_cents]).to include ("is not a number")
    end

    it 'should fail to save when quantity isnt set' do
      @product = Product.new
      @product.quantity = nil
      @product.valid?
      expect(@product.errors[:quantity]).to include ("can't be blank")
    end

    it 'should fail to save when category isnt set' do
      @product = Product.new
      @product.category = nil
      @product.valid?
      expect(@product.errors[:category]).to include ("can't be blank")
    end

  end
end