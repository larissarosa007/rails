require 'roo'

def cadastro () 
    puts "Digite seu nome:"
    name= gets.chomp
end

puts cadastro

# Abra o arquivo da planilha do Excel
workbook = Roo::Excelx.new("Dados.xlsx")  # Substitua "exemplo.xlsx" pelo caminho do seu arquivo Excel

# Acesse a primeira planilha do arquivo (índice 0)
workbook.default_sheet = workbook.sheets.first

# Itere sobre as linhas da planilha e imprima os dados

workbook.each_row_streaming(offset: 1) do |row|
  puts "#{row[1]} #{row[2]} #{row[3]} #{row[4]} #{row[5]} #{row[6]}"  #código exibe somente as linhas com dados do arquivo excel
end
    