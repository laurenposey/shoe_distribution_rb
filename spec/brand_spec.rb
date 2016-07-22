require('spec_helper')

describe(Brand) do
  describe('#stores')do
    it("tells you what stores are associated with the brand") do
      brand = Brand.create({:name => "Steve Madden"})
      store = Store.create({:name => "DSW"})
      store2 = Store.create({:name => "Macys"})
      store3 = Store.create({:name => "Shoe Depot"})
      brand.stores.push(store)
      brand.stores.push(store2)
    expect(brand.stores()).to(eq([store, store2]))
    end
  end
end
