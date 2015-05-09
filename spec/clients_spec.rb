require('spec_helper')


describe(Clients) do

  describe(".all") do
    it("is empty at first") do
      expect(Clients.all()).to(eq([]))
    end
  end

   describe("#name") do
    it("lets you give it a persons name") do
      test_client = Clients.new({:name => "Skinny Guy", :stylist_id => 1})
      expect(test_client.name()).to(eq("Skinny Guy"))
    end
  end

  describe("#==") do
    it("is the same client if it is the same person") do
      client1 = Clients.new({:name=> "Funny Girl", :stylist_id => 1})
      client2 = Clients.new({:name => "Funny Girl", :stylist_id => 1})
      expect(client1).to(eq(client2))
    end
  end
end