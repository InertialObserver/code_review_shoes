require "spec_helper"

  describe(Shoe) do
    it { should have_and_belong_to_many(:stores) }

    it("validates presence of a brand") do
      shoe = Shoe.new(brand: '')
      expect(shoe.save()).to(eq(false))
    end

    it("capitalizes user entry upon save") do
      shoe = Shoe.create(brand: 'nike')
      expect(shoe.brand).to(eq("Nike"))
    end
  end
