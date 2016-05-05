File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
  line.chomp!
  unless line.empty?
    c_string, p_string = line.split(";")
    if c_string.nil? || p_string.nil?
      puts sprintf('%.2f', 0.0)
      next
    end
    customers = c_string.split(",")
    products = p_string.split(",")
    scores = []
    products.each_with_index do |product, i|
      scores << Array.new(customers.size)
      product_letters = product.scan(/[a-zA-Z]/).count
      customers.each_with_index do |customer, j|
        customer_letters = customer.scan(/[a-zA-Z]/).count
        customer_vowels = customer.downcase.scan(/[aeiouy]/).count
        if product_letters.odd?
          scores[i][j] = (customer_letters - customer_vowels).to_f
        else
          scores[i][j] = 1.5 * customer_vowels
        end
        max = [customer_letters, product_letters].max
        common_factor = false
        2.upto(max) do |div|
          if customer_letters%div == 0 && product_letters%div == 0
            common_factor = true
            break
          end
        end
        scores[i][j] *= 1.5 if common_factor
      end
    end

    max_score = 0.0
    if products.count > customers.count
      (0...products.count).to_a.permutation(customers.count) do |list|
        score = 0.0
        list.each_with_index { |i, j| score += scores[i][j] }
        max_score = score if score > max_score
      end
    else
      (0...customers.count).to_a.permutation(products.count) do |list|
        score = 0.0
        list.each_with_index { |j, i| score += scores[i][j] }
        max_score = score if score > max_score
      end
    end

    puts sprintf('%.2f', max_score)
  end
end
