namespace :data do

  task :wipe_region_data => :environment do
    Neighborhood.destroy_all
    Subregion.destroy_all
    Region.destroy_all
  end

  task :import_regions => :environment do
    # my_logger = Logger.new("#{Rails.root}/log/data_import.log")
    # Rails.logger
    # require 'progress_bar'
    require 'json'
    # bar = ProgressBar.new(User.all.count) # pass the total for the progress bar
    json = ActiveSupport::JSON.decode(File.read('all_cl_regions.json'))
    # my_logger.info "Starting at #{Time.now}"


    json.each do |a|
      region = Region.new(
                  :name       =>     a['name'].capitalize,
                  :shortname  =>     a['shortcode'],
                  :state      =>     a['state']
                  )
      # region = Region.find_by_shortname(a['shortcode'])
      # my_logger.info "region: #{a['name'].capitalize} -- #{a['shortcode']} -- #{a['state']}"
      a['subregions'].each do |subregion|
        subregion_obj = Subregion.new(
                  :name       =>    subregion['name'],
                  :shortname  =>    subregion['shortcode']
        )
        # my_logger.info "subregion: #{subregion['name'].capitalize} -- #{subregion['shortcode']}"
        subregion['neighborhoods'].each do |neighborhood|
          subregion_obj.neighborhoods << Neighborhood.new(
                  :name       =>    neighborhood['name']
          )
          # my_logger.info "neighborhood: #{neighborhood['name']}"
        end
        region.subregions << subregion_obj
      end
      region.save
    end


    # my_logger.info "Ending at #{Time.now}"

  end

end
