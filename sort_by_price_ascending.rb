require 'json'
def sort_by_price_ascending(json_string)
  items = JSON.parse(json_string)
  # sorted = items.sort_by {|i| i['name']}.sort_by! {|i| i['price']}
  sorted = items.sort { |a,b| a['price'] == b['price']? a['name'] <=> b['name'] : a['price'] <=> b['price'] }
  return JSON.unparse(json_string)
end

puts sort_by_price_ascending('[{"name":"eggs","price":1},{"name":"egg","price":9.99},{"name":"coffee","price":9.99},{"name":"rice","price":4.04},{"name":"ric","price":4.04}]')