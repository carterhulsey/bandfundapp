desc "Removes old featured artist and replaces it with new"
  task :featured => :environment do
    puts "Removing old featured artist"
    artist = Artist.all.find_by(featured: true)
    artist.update_attributes(featured: false)
    puts "Saving new featured artist"
    artist = Artist.all.find_by(id: ENV['ID'])
    artist.update_attributes(featured: true)
  end
