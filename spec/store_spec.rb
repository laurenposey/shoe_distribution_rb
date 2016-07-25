describe(Store) do

  it('validates presence of name') do
    store = Store.new({:name => ''})
    expect(store.save()).to(eq(false))
  end

  it('converts the name to capitalize first letter') do
    store = Store.create({:name => 'macys'})
    expect(store.name()).to(eq('Macys'))
  end

  describe('#brands')do
    it("tells you what brands are associated with the store") do
      brand = Brand.create({:name => "Steve Madden"})
      brand1 = Brand.create({:name => "Christian Louboutin"})
      brand2 = Brand.create({:name => "Prada"})
      store = Store.create({:name => "J.Crew"})
      store.brands.push(brand1)
      store.brands.push(brand)
    expect(store.brands()).to(eq([brand, brand1]))
    end
  end
end
