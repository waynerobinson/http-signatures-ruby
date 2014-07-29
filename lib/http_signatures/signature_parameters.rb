module HttpSignatures
  class SignatureParameters

    def initialize(key_id:, algorithm_name:, header_names:, signature:)
      @key_id = key_id
      @algorithm_name = algorithm_name
      @header_names = header_names
      @signature = signature
    end

    # TODO: to_str instead/also?
    def to_s
      parameter_components.join(",")
    end

    private

    def parameter_components
      pc = []
      pc << 'keyId="%s"' % @key_id
      pc << 'algorithm="%s"' % @algorithm_name
      pc << 'headers="%s"' % @header_names.join(" ")
      pc << 'signature="%s"' % @signature
      pc
    end

  end
end