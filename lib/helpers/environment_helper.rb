module EnvironmentHelper

  #set dynamic variable
  def self.global_variable_set(name, value)
    eval "$#{name} = value"
  end

  def self.read_yml_file(path_file, symbolize_keys: false)
    unless File.exist?(path_file)
      fail FileNotFound.new("File doesn\'t exist on: \n[ #{path_file} ]")
    end

    file_name = path_file.match(/.*\/(.*)\./)[1]
    hash = YAML::load(File.open(path_file))
    converted = symbolize_keys ? convert_to_sym(hash) : hash
    global_variable_set(file_name, converted)
  end

  def self.convert_to_sym(hash)
    json = MultiJson.dump(hash)
    MultiJson.load(json, :symbolize_ewwkeys => true)
  end

  class FileNotFound < StandardError; end
end
