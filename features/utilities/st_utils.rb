ST_JSON_PATH = YAML.load_file(File.join(__dir__, '../data/ST_test_data/ST_json_path.yaml'))
$api_entries_log = Hash.new

def check_json_field_type(json_path, json_obj)
  if json_path.include? '.'
    p path_str = json_path[0..(json_path.index('.') - 1)]
    if num? path_str
      next_obj = path_str.to_i
    else
      next_obj = path_str
    end
    check_json_field_type(json_path.sub(next_obj.to_s + '.', ''), json_obj[next_obj])
  else
    path_str = json_path[0..json_path.index(':') - 1]
    if num? path_str
      json_key = path_str.to_i
    else
      json_key = path_str
    end
    p "current json key #{json_key}"
    json_field_type = json_path[(json_path.index(':') + 1)..(json_path.length - 1)]
    p field_possible_types = json_field_type.split('|')
    is_correct = false
    field_possible_types.each do |value|
      is_correct = is_correct || json_obj[json_key].is_a?(string_to_instance(value))
    end
    p "#{json_obj[json_key]} has correct class" if is_correct
    is_correct
  end
end

def num?(string_number)
  num = string_number.to_i
  num.to_s == string_number
end


module Bool
  ;
end
class TrueClass;
  include Bool;
end
class FalseClass;
  include Bool;
end

def string_to_instance(string_type)
  test = {"String" => String, "Int" => Integer, "Float" => Float, "Bool" => Bool, "Nil" => NilClass}
  test[string_type]
end

def st_get_json_paths
  ST_JSON_PATH['json_paths']
end

def st_get_json_adobe_data_layer
  ST_JSON_PATH['adobe_data_layer_paths']
end
