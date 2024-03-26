def generate_html_grid(rows, cols)
    html = <<-HTML
    <!DOCTYPE html>
    <html lang="en">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grid com Dados do Mouse</title>
    <style>
      /* Estilo para as células do grid */
      .cell {
        width: 50px;
        height: 50px;
        border: 1px solid black;
        text-align: center;
        line-height: 50px;
        cursor: pointer; /* Muda o cursor para uma mão quando passa sobre a célula */
      }
      .selected {
        background-color: yellow; /* Cor de fundo para célula selecionada */
      }
    </style>
    </head>
    <body>
  
    <table>
      <tbody id="grid">
    HTML
  
    rows.times do
      html << "<tr>"
      cols.times do
        html << "<td class='cell'></td>"
      end
      html << "</tr>"
    end
  
    html << <<-HTML
      </tbody>
    </table>
  
    <script>
      // Obtém todas as células do grid
      const cells = document.querySelectorAll('.cell');
  
      // Adiciona um evento de clique para cada célula
      cells.forEach(cell => {
        cell.addEventListener('click', function() {
          // Remove a classe 'selected' de todas as células
          cells.forEach(cell => {
            cell.classList.remove('selected');
          });
  
          // Adiciona a classe 'selected' à célula clicada
          this.classList.add('selected');
          this.textContent = '1'; // Define os dados da célula como '1'
        });
      });
    </script>
  
    </body>
    </html>
    HTML
  
    html
  end
  
  # Define o tamanho do grid (7 linhas x 16 colunas)
  rows = 7
  cols = 16
  
  # Gera o HTML do grid
  html = generate_html_grid(rows, cols)
  
  # Salva o HTML em um arquivo
  File.open("grid.html", "w") do |file|
    file.puts html
  end
  
  puts "Arquivo 'grid.html' gerado
  