module BaseHelper
  def rand_str(length=8)
    raise if length < 1

    result = ""
    array = []

    #  matching regex [a-z0-9]([-a-z0-9]*[a-z0-9])?
    #  e.g. project name (up to 63 chars)
    for c in 'a'..'z' do array.push(c) end

    length.times { result << array[rand(array.length)] }

    return result
  end
end
