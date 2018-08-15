namespace :data do

  task :wipe_all_cats => :environment do
    Subcategory.destroy_all
    Category.destroy_all
  end

  task :import_cats => :environment do
    

  end

end
