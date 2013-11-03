require 'active_record'
require 'yaml'
require 'logger'

task :default => :migrate

task :migrate => :environment do
  ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
end

task :environment do
  ActiveRecord::Base.establish_connection(YAML::load(File.open('db/database.yml')))
  ActiveRecord::Base.logger = Logger.new(File.open('db/database.log', 'a'))
end

task :generate, [:migration_class_name] => :environment do |t,args|
	class String
	  def underscore
	    self.gsub(/::/, '/').
	    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
	    gsub(/([a-z\d])([A-Z])/,'\1_\2').
	    tr("-", "_").
	    downcase
	  end
	end

	migration_template  = Dir.pwd + "/db/migration_template.rb"
	migration_action = true
	migration_class_name = args[:migration_class_name] 
	
	if migration_class_name.nil? 
		print "Usage: rake generate[ClassName] \n"
		print "You may need to escape the [] chars with a \\ like \\[AddingFieldsToSomeTable\\]"
		next
	end
	now = Time.new
	file_start = now.strftime("%Y%m%d%H%M%S")
	file_name = file_start + "_" + migration_class_name.underscore
	
	attributes = []
	load migration_template
	$stdout = File.new(Dir.pwd + "/db/migrate/"+file_name+".rb","w")
	generate_migration_template(migration_template,migration_action,migration_class_name,attributes)
	$stdout = STDOUT

end

