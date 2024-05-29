def rotate_object(object)
  case object
  when Array, String
    object.empty? ? object : object[1..-1] + object[0, 1]
  when Hash
    rotate_object(object.to_a).to_h
  when Integer
    sign = object.positive? ? 1 : -1
    sign * rotate_object(object.abs.to_s).to_i
  else
    "Unable to rotate this type of object."
  end
end
