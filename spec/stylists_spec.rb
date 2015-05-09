require('spec_helper')


describe(Stylists) do

  describe(".all") do
    it("starts off with no Stylists") do
      expect(Stylists.all()).to(eq([]))
    end
  end

    describe("#stylist") do
    it("tells you their name") do
      style = Stylists.new({:stylist => "Debbie", :id => nil})
      expect(style.stylist()).to(eq("Debbie"))
    end
  end

  describe("#id") do
    it("sets its ID when you save them") do
      stylist = Stylists.new({:stylist=> "Debbie", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same stylist if they have the same name") do
      stylist1 = Stylists.new({:stylist => "Debbie", :id => nil})
      stylist2 = Stylists.new({:stylist => "Debbie", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end


  describe(".find") do
    it('returns a stylist by their ID') do
      test_stylist = Stylists.new({:stylist => "Debbie", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylists.new({:stylist => "Mike", :id => nil})
      test_stylist2.save()
      expect(Stylists.find(test_stylist.id())).to(eq(test_stylist))
    end
  end

  describe("#client") do
    it("returns an array of clients associated with a particular stylist") do
      test_stylist = Stylists.new({:stylist => "Debbie", :id => nil})
      test_stylist.save()
      test_client = Clients.new({:name => "Charlie", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Clients.new({:name => "Fred", :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.client()).to(eq([test_client,test_client2]))
    end
  end
  
end
