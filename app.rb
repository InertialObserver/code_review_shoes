require("bundler/setup")
Bundler.require(:default, :production)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  @shoes = Shoe.all()
  erb(:index)
end

get("/stores") do
  @stores = Store.all()
  erb(:store)
end

post("/stores") do
  name = params.fetch("name")
  @store = Store.new({:name => name})
  if @store.save()
    redirect("/stores")
  else
    erb(:error)
  end
end

get("/shoes") do
  @shoes = Shoe.all()
  erb(:shoe)
end

post("/shoes") do
  brand = params.fetch("brand")
  @shoe = Shoe.new({:brand => brand})
  if @shoe.save()
    redirect("/shoes")
  else
    erb(:error)
  end
end

get("/shoe/:id") do
  @shoe = Shoe.find(params.fetch("id").to_i())
  erb(:shoe_info)
end

get("/store/:id") do
  @store = Store.find(params.fetch("id").to_i())
  @shoes = Shoe.all()
  erb(:store_info)
end

get("/stores/:id") do
  @store = Store.find(params.fetch("id").to_i())
  @shoes = Shoe.all()
  erb(:store_info)
end

patch("/stores/:id/edit") do
  id = params.fetch("id").to_i()
  name = params.fetch("name")
  Store.find(id).update({:name => name})
  redirect("/stores")
end

delete("/store/:id") do
  id = params.fetch("id").to_i()
  Store.find(id).destroy()
  redirect("/stores")
end

delete("/shoe/:id") do
  id = params.fetch("id").to_i()
  Shoe.find(id).destroy()
  redirect("/shoes")
end

post('/stores/:id/shoes') do
  store_id = params.fetch('id').to_i
  shoe_ids = params.fetch('shoe_ids')
  store = Store.find(store_id)
  shoe_ids.each do |shoe_id|
    shoe = Shoe.find(shoe_id.to_i)
    store.shoes().push(shoe)
  end
  redirect('/stores/'.concat(store_id.to_s))
end
