require 'gosu'

class GridWindow < Gosu::Window
  def initialize
    super(400, 400)
    self.caption = "Grid com Dados do Mouse"

    @grid_size = 5
    @cell_size = width / @grid_size

    # Array para armazenar os dados do grid
    @grid_data = Array.new(@grid_size) { Array.new(@grid_size, '') }
  end

  def update
    # Atualiza os dados do grid quando o mouse passa sobre uma célula
    if mouse_x.between?(0, width - @cell_size) && mouse_y.between?(0, height - @cell_size)
      col = (mouse_x / @cell_size).to_i
      row = (mouse_y / @cell_size).to_i
      @grid_data[row][col] = 'X'
    end
  end

  def draw
    # Desenha o grid e os dados
    @grid_data.each_with_index do |row, i|
      row.each_with_index do |data, j|
        Gosu.draw_rect(j * @cell_size, i * @cell_size, @cell_size, @cell_size, Gosu::Color::WHITE)
        font.draw_text(data, j * @cell_size + @cell_size / 2 - font.text_width(data) / 2, i * @cell_size + @cell_size / 2 - font.height / 2, 0)
      end
    end
  end

  def needs_cursor?
    true # Habilita o cursor do mouse
  end

  def font
    @font ||= Gosu::Font.new(20)
  end
end

GridWindow.new.show
