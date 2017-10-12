Transform /.+/ do |arg|
  # @param [String] str to be expanded
  # @return string with expanded evaluation of expressions
  # @note original string object should never be modified here
  expand_str = proc do |str|
    begin
      x = str.gsub(/<%=(.+?)%>/m) { |c|
        eval $1
      }
    rescue => e
      Kernel::puts "Expand ERROR with argument: #{str.to_s}\n" \
        "#{e.inspect}\n#{e.backtrace.join("\n")}"
      x = str
    end
    x
  end

  if arg.respond_to? :raw
    # this is a table
    modified_args = arg.raw.map{ |row|
      row.map { |cell|
        expand_str.call(cell)
      }
    }
    table(modified_args) #must be different than given _ARG_
  else
    # normal step argument
    expand_str.call(arg)
  end
end
