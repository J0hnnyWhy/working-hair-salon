require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

DB = PG.connect({:dbname => 'hair_salon_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM clients *;")
    DB.exec("DELETE FROM stylists *;")
  end
end

describe('path to viewing all stylists', {:type => :feature}) do
  it('allows user to click link and view all stylists') do
    stylis = Stylists.new({:stylist => 'Bob', :id => nil})
    stylis.save()
    visit('/')
    click_link('View All Stylists')
    expect(page).to have_content(stylis.stylist())
  end
end

describe('adding a new stylist', {:type => :feature}) do
  it('allows a user to click a stylist to see the clients') do
    visit('/')
    click_link('Add New Stylist')
    fill_in('stylist', :with =>'Sally')
    click_button('Add Stylist')
    expect(page).to have_content('Success!')
  end
end

describe('the path to viewing details of individual stylist', {:type => :feature}) do
  it('allows user to click on stylist name view clients') do
    test_stylist = Stylists.new({:stylist => 'Sue', :id => nil})
    test_stylist.save()
    test_client = Clients.new({:name => 'Mean Lady', :stylist_id => test_stylist.id()})
    test_client.save()
    visit('/stylists')
    click_link(test_stylist.stylist())
    expect(page).to have_content(test_client.name)
  end
end

describe('path to add a new client', {:type => :feature}) do
  it('allows the user to add a new client') do
    test_stylist = Stylists.new({:stylist => 'Jocelyn', :id => nil})
    test_stylist.save()
    visit("/stylists/#{test_stylist.id()}")

    click_link('Add New Client')
    fill_in('name', :with => 'Jim')
    click_button('Add Client')
    expect(page).to have_content('Success!')

  end
end
