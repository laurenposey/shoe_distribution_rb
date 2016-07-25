require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('launchy')

describe('home page path', {:type => :feature}) do
  it('allows a user to view the homepage') do
    visit('/')
    expect(page).to have_content('Fancy Shoes')
  end
end


describe('add a new store', {:type => :feature}) do
  it('allows the user to add a store') do
    visit('/')
    click_link('Add New Store')
    fill_in("name", :with => 'macys')
    click_button('Add store')
    expect(page).to have_content('Macys')
  end
end

describe('add a new brand', {:type => :feature}) do
  it('allows the user to add a brand') do
    visit('/')
    click_link('Add New Brand')
    fill_in("name", :with => 'prada')
    click_button('Add brand')
    expect(page).to have_content('Fancy Shoes')
  end
end

describe('update a store', {:type => :feature}) do
  it('allows the user to update a store') do
    visit('/')
    click_link('Add New Store')
    fill_in("name", :with => 'macys')
    click_button('Add store')
    expect(page).to have_content('Macys')
    click_link('Macys')
    click_link('Update')
    fill_in("name", :with => 'jcrew')
    click_button('Update name')
    expect(page).to have_content('Fancy Shoes')
  end
end

describe('delete a store', {:type => :feature}) do
  it('allows the user to delete a store') do
    visit('/')
    click_link('Add New Store')
    fill_in("name", :with => 'macys')
    click_button('Add store')
    expect(page).to have_content('Macys')
    click_link('Macys')
    click_link('Update')
    click_button('Delete')
    expect(page).to have_content('Fancy Shoes')
  end
end

describe('add a new store error page', {:type => :feature}) do
  it('notifies user they made an error') do
    visit('/')
    click_link('Add New Store')
    fill_in("name", :with => '')
    click_button('Add store')
    expect(page).to have_content('Oops')
  end
end

describe('add a new brand error', {:type => :feature}) do
  it('notifies user they made an error') do
    visit('/')
    click_link('Add New Brand')
    fill_in("name", :with => '')
    click_button('Add brand')
    expect(page).to have_content('Oops')
  end
end
