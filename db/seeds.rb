# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts "Destroying all existing data..."
User.destroy_all
Category.destroy_all
Post.destroy_all
Region.destroy_all
Subregion.destroy_all
Neighborhood.destroy_all

# DATAAAA
categories = [ "w4w","w4ww","w4mw","w4t","w4m",
  "w4mm","w4tt","ww4w","ww4ww","ww4mw",
  "ww4t","ww4m","ww4mm","ww4tt","mw4m",
  "mw4ww","mw4mw","mwt","mw4m","mw4mm",
  "mw4tt","t4w","t4ww","t4mw","t4t","t4m",
  "t4mm","t4tt","m4w","m4ww","m4mw","m4t",
  "m4m","m4mm","m4tt"
]
sf_neighborhoods = [
  {name:"Alamo Square / Nopa"},
  {name:"Bayview"},
  {name:"Bernal Heights"},
  {name:"Castro / Upper Market"},
  {name:"Cole Valley / Ashbury Hts"},
  {name:"Downtown / Civic / Van Ness"},
  {name:"Excelsior / Outer Mission"},
  {name:"Financial District"},
  {name:"Glen Park"},
  {name:"Haight Ashbury"},
  {name:"Ingleside / SFSU / CCSF"},
  {name:"Laurel Hts / PResidio"},
  {name:"Lower Haight"},
  {name:"Lower Nob Hill"},
  {name:"Lower Pac Hts"},
  {name:"Marina / Cow Hollow"},
  {name:"Mission District"},
  {name:"Nob Hill"},
  {name:"North Beach / Telegraph Hill"},
  {name:"Pacific Heights"},
  {name:"Portola District"},
  {name:"Potrero Hill"},
  {name:"Richmond / Seacliff"},
  {name:"Russian Hill"},
  {name:"SOMA / South Beach"},
  {name:"Sunset / Parkside"},
  {name:"Tenderloin"},
  {name:"Treasure Island"},
  {name:"Twin Peaks / Diamond Hts"},
  {name:"USF / Panhandle"},
  {name:"Visitacion Valley"},
  {name:"West Portal / Forest Hill"},
  {name:"Wester Addition"}
]
eby_neighborhoods = [
  {name: "Alameda"},
  {name: "Albany / El Cerrito"},
  {name: "Berkeley"},
  {name: "berkeley North / Hills"},
  {name: "Concord / Pleasant Hill / Martinez"},
  {name: "Danville / San Ramon"},
  {name: "Dublin / Pleasanton / Livermore"},
  {name: "Emeryville"},
  {name: "Fairfield / Vacaville"},
  {name: "Fremont / Union City / Newark"},
  {name: "Hayward / Castro Valley"},
  {name: "Hercules, Pinole, San Pablo, El Sob"},
  {name: "Lafayette / Orinda / Moraga"},
  {name: "Oakland Downtown"},
  {name: "Oakland East"},
  {name: "Oakland Hills / Mills"},
  {name: "Oakland Lake Merritt / Grand"},
  {name: "Oakland North / Temescal"},
  {name: "Oakland Piedmont / Montclair"},
  {name: "Oakland Rockridge / Claremont"},
  {name: "Oakland West"},
  {name: "Pittsburg / Antioch"},
  {name: "Richmond / Point / Annex"},
  {name: "San Leandro"},
  {name: "Vallejo / Benicia"},
  {name: "Walnut Creek"}
]
nby_neighborhoods = [
  {name:"corte madera"},
  {name:"fairfax"},
  {name:"greenbrae"},
  {name:"healdsburg / windsor"},
  {name:"kentfield / ross"},
  {name:"lake county"},
  {name:"larkspur"},
  {name:"mendocino county"},
  {name:"mill valley"},
  {name:"napa county"},
  {name:"novato"},
  {name:"petaluma"},
  {name:"rohnert pk / cotati"},
  {name:"russian river"},
  {name:"san anselmo"},
  {name:"san rafael"},
  {name:"santa rosa"},
  {name:"sausalito"},
  {name:"sebastopol"},
  {name:"sonoma"},
  {name:"tiburon / belvedere"},
  {name:"west marin"}
]
pen_neighborhoods = [
  {name:"atherton"},
  {name:"belmont"},
  {name:"brisbane"},
  {name:"burlingame"},
  {name:"coastside/pescadero"},
  {name:"daly city"},
  {name:"east palo alto"},
  {name:"foster city"},
  {name:"half moon bay"},
  {name:"los altos"},
  {name:"menlo park"},
  {name:"millbrae"},
  {name:"mountain view"},
  {name:"pacifica"},
  {name:"palo alto"},
  {name:"portola valley"},
  {name:"redwood city"},
  {name:"redwood shores"},
  {name:"san bruno"},
  {name:"san carlos"},
  {name:"san mateo"},
  {name:"south san francisco"},
  {name:"woodside"}
]
scz_neighborhoods = [
  {name:"aptos"},
  {name:"boulder creek"},
  {name:"capitola"},
  {name:"santa cruz"},
  {name:"scotts valley"},
  {name:"soquel"},
  {name:"watsonville"}
]
sby_neighborhoods = [
  {name:"campbell"},
  {name:"cupertino"},
  {name:"gilroy"},
  {name:"hollister"},
  {name:"los gatos"},
  {name:"milpitas"},
  {name:"morgan hill"},
  {name:"mountain view"},
  {name:"san jose downtown"},
  {name:"san jose east"},
  {name:"san jose north"},
  {name:"san jose south"},
  {name:"san jose west"},
  {name:"santa clara"},
  {name:"saratoga"},
  {name:"sunnyvale"},
  {name:"willow glen / cambrian"}
]
sfbay_sub = [
  {name:"San Francisco", shortname:"sfc", neighborhoods:sf_neighborhoods},
  {name:"East Bay", shortname:"eby", neighborhoods:eby_neighborhoods},
  {name:"North Bay", shortname:"nby", neighborhoods: nby_neighborhoods},
  {name:"South Bay", shortname:"sby", neighborhoods: sby_neighborhoods},
  {name:"Santa Cruz", shortname:"scz", neighborhoods: scz_neighborhoods},
  {name:"Peninsula", shortname:"pen", neighborhoods: pen_neighborhoods}
]
la_sub = [
  {name:"Westside-South Bay", shortname:"wst"},
  {name:"SF Valley", shortname:"sfv"},
  {name:"Central LA", shortname:"lac"},
  {name:"San Gabriel Valley", shortname:"sgv"},
  {name:"Long Beach / 562", shortname:"lgb"},
  {name:"Antalope Valley", shortname:"ant"}
]

puts "creating a few regions"
sfbay_region = Region.create({
  shortname:"sfbay",
  name: "San Francisco Bay Area",
  softlink: "sf"
  })
la_region = Region.create({
  shortname:"losangeles",
  name: "Los Angeles Area",
  softlink:"la"
  })

puts "Creating subregions & neighborhoods..."
puts "sfbay..."


# sfbay_region.subregions.build(name:"San Francisco", shortname:"sfc").neighborhoods.build(name:"Alamo Square / Nopa")

# Region.first.subregions.build(name:"San Francisco", shortname:"sfc").neighborhoods.build(name:"Alamo Square / Nopa")
#because SF has neighborhoods - LA doesn't -- can clean up later
sfbay_sub.each do |subregion|
  subregion_obj = Subregion.new(name:subregion[:name], shortname:subregion[:shortname])
  subregion[:neighborhoods].each do |neighborhood|
    # puts "#{subregion[:name]} >> #{neighborhood[:name]}"
    subregion_obj.neighborhoods.build(name: neighborhood[:name])
  end
  puts subregion_obj.to_json
  sfbay_region.subregions << subregion_obj
  sfbay_region.save!
end

puts "la..."
la_sub.each { |subregion| la_region.subregions << Subregion.create({name:subregion[:name], shortname:subregion[:shortname]}) }


puts "create a user.."
user = User.create!({
  username: "william",
  email: "williamkasel@me.com",
  password: "will123"
})

puts "create our categories"
categories.each { |cat| Category.create!({category:cat})}

puts "hopefully, this completed without errors. Done!"
