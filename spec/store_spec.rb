require "spec_helper"

  describe(Store) do
    it { should have_and_belong_to_many(:shoes) }

    it("validates presence of a name") do
      store = Store.new(name: '')
      expect(store.save()).to(eq(false))
    end

    it("capitalizes user entry upon save") do
      store = Store.create(name: 'sports authority')
      expect(store.name).to(eq("Sports authority"))
    end
end
