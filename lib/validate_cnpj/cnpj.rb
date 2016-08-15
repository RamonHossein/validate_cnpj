module ValidateCnpj
  class Cnpj
    def initialize(document)
      @validate = validation(document)
    end

    def validation(document)
      return true if document.blank?
      return false if regex(document) == false
      return false if verify_blacklist(document) == true
      return validate?
    end

    def valid?
      @validate
    end

    private

      def regex(document)
        doc = document =~ /^(\d{2}\.?\d{3}\.?\d{3}\/?\d{4})-?(\d{2})$/
        @number = $1
        @result = $2
        doc == 0 ? true : false
      end

      def validate?
        @number = @number.gsub(/[\/.-]/, "")
        @result == (first_verification + second_verification) ? true : false
      end

      def first_verification
        sum = multiply_sum([5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2], @number)
        verification(sum%11).to_s
      end

      def second_verification
        sum = multiply_sum([6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2], @number + first_verification)
        verification(sum%11).to_s
      end

      def multiply_sum(array, number)
        multiply = []
        number.scan(/\d{1}/).each_with_index { |e, i| multiply[i] = e.to_i * array[i] }
        multiply.inject { |s, e| s + e }
      end

      def verification(rest)
        rest < 2 ? 0 : (11 - rest)
      end

      def verify_blacklist(document)
        cnpj = formal_cnpj(document)
        BLACKLIST.include?(cnpj)
      end

      def formal_cnpj(document)
        document = document.gsub(/[\/.-]/, "")
        document =~ /(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/
        return "#{$1}.#{$2}.#{$3}/#{$4}-#{$5}"
      end

      BLACKLIST= [
        "00.000.000/0000-00",
        "11.111.111/1111-11",
        "22.222.222/2222-22",
        "33.333.333/3333-33",
        "44.444.444/4444-44",
        "55.555.555/5555-55",
        "66.666.666/6666-66",
        "77.777.777/7777-77",
        "88.888.888/8888-88",
        "99.999.999/9999-99"
      ]
  end
end
