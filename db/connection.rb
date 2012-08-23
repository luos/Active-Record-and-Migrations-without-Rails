#coding : utf-8
require 'active_record'
require 'yaml'

dbconfig = YAML::load(File.open('db/database.yml'))
ActiveRecord::Base.establish_connection(dbconfig)

