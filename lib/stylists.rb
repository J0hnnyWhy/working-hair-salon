require('pry')
class Stylists
  attr_reader(:stylist, :id)

  define_method(:initialize) do |attributes|
    @stylist = attributes.fetch(:stylist)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |styler|
      name = styler.fetch("stylist")
      id = styler.fetch("id").to_i()
      stylists.push(Stylists.new({:stylist => name, :id => id}))
    end
    stylists
    end
# binding.pry
    define_method(:save) do
    result = DB.exec("INSERT INTO stylists (stylist) VALUES ('#{@stylist}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

   define_method(:==) do |another_stylist|
    self.stylist().==(another_stylist.stylist()).&(self.id().==(another_stylist.id()))
  end

  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylists.all().each() do |stylist|
      if stylist.id()==(id)
        found_stylist = stylist
      end
    end
    found_stylist
  end

	define_method(:client) do
	    stylist_clients = []
	    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
	    clients.each() do |client|
	      name = client.fetch("name")
	      stylist_id = client.fetch("stylist_id").to_i()
	      stylist_clients.push(Clients.new({:name => name, :stylist_id => stylist_id}))
	    end
	    stylist_clients
	    # binding.pry
	end

end
