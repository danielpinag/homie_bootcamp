class Dictionary

  def self.all
    {
      english: { 
        department: {español: "departamento"},
        tenant: {español: "inquilino"},
        owner: {español: "propietario"},
        rent: {español: "renta"}
      },
    
      español: {
        departamento: {english: "department"},
        inquilino: {english: "tenant"},
        propietario: {english: "owner"},
        renta: {english: "rent"}
      }
    }
  end
  
  def self.translate(word_to_translate, language_for_translate)
    all.each do |language, word_list|
      next unless language == language_for_translate.downcase.to_sym 

      word_list.each do |word, translations|
        next unless translations.has_value?(word_to_translate.downcase)

        return word
      end
    end
  end
end

puts Dictionary.translate("tenant", "EspaÑol")