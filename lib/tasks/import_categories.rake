namespace :data do

  task :wipe_all_cats => :environment do
    Subcategory.destroy_all
    Category.destroy_all
  end

  task :import_cats => :environment do
    #important that shortnames match to routes
    Category.create!({:name => "Casual Encounters", :shortname => "casual-encounters"})
    Category.create!({:name => "Missed Connections", :shortname => "missed-connections"})
    Category.create!({:name => "Strictly Platonic", :shortname => "strictly-platonic"})
    Category.create!({:name => "Dating", :shortname => "dating"})
  end

  task :import_subcats => :environment do
    sub_categories = [ "w4w","w4ww","w4mw","w4t","w4m",
      "w4mm","w4tt","ww4w","ww4ww","ww4mw",
      "ww4t","ww4m","ww4mm","ww4tt","mw4m",
      "mw4ww","mw4mw","mwt","mw4m","mw4mm",
      "mw4tt","t4w","t4ww","t4mw","t4t","t4m",
      "t4mm","t4tt","m4w","m4ww","m4mw","m4t",
      "m4m","m4mm","m4tt"
    ]
    Category.all.each do |cat|
      sub_categories.each {|subc| cat.subcategories.create!({:name => subc, :shortname => subc})}
    end
  end

end
