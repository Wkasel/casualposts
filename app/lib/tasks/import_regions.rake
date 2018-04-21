# namespace :data do
#
#   task :import_regions do |t|
#     my_logger = Logger.new("#{Rails.root}/log/data_import.log")
#     require 'progress_bar'
#     require 'json'
#     # bar = ProgressBar.new(User.all.count) # pass the total for the progress bar
#     json = ActiveSupport::JSON.decode(File.read('all_cl_regions.json'))
#     my_logger.info "Starting at #{Time.now}"
#
#     json.each do |a|
#       bar.increment!
#       my_logger.info a[:name]
#     end
#
#
#     my_logger.info "Ending at #{Time.now}"
#
#   end
#
# end
