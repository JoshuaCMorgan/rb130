=begin
The following list contains the names of individuals who are 
pioneers in the field of computing or that have had a 
significant influence on the field. The names are in an 
encrypted form, though, using a simple (and incredibly weak) 
form of encryption called Rot13.

Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu

Write a program that deciphers and prints each of these names.
=end

#Brute force
ARR1 = ('a'..'m').to_a + ('A'..'M').to_a
ARR2 = ('n'..'z').to_a + ('N'..'Z').to_a
ENCRYPTED_NAMES = [ "Nqn Ybirynpr", "Tenpr Ubccre", "Nqryr Tbyqfgvar", "Nyna Ghevat",
  "Puneyrf Onoontr", "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv", 
  "Wbua Ngnanfbss", "Ybvf Unvog", "Pynhqr Funaaba","Fgrir Wbof", 
  "Ovyy Tngrf", "Gvz Orearef-Yrr", "Fgrir Jbmavnx", "Xbaenq Mhfr",
  "Fve Nagbal Ubner", "Zneiva Zvafxl", "Lhxvuveb Zngfhzbgb",
  "Unllvz Fybavzfxv", "Tregehqr Oynapu" ]

  def rotate_13(persons) 
  result = []

  persons.each do |person|
    name = ""
    person.each_char do |char|
      if ARR1.include?(char)
        idx = ARR1.index(char)
        name << ARR2[idx]
      elsif ARR2.include?(char)
        idx = ARR2.index(char)
        name << ARR1[idx]
      else
        name << char
      end
    end
    result << name
  end
 
  result
end

p rotate_13(ENCRYPTED_NAMES)

# Launch School
def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                         encrypted_char
  end
end

ENCRYPTED_NAMES.each do |encrypted_name|
  puts rot13(encrypted_name)
end