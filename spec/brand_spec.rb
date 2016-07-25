require('spec_helper')

describe(Brand) do

  it('validates presence of name') do
    brand = Brand.new({:name => ''})
    expect(brand.save()).to(eq(false))
  end

  it('converts the name to capitalize first letter') do
    brand = Brand.create({:name => 'christian louboutin'})
    expect(brand.name()).to(eq('Christian Louboutin'))
  end


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
