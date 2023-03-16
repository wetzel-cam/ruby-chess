class Board
    ASCII_A = 97
    ASCII_8 = 56
    
    @@tile = {}
    @@background = []
    @@scale = 4

    @@tileset = Tileset.new(
        'resources/background-tiles.png',
        tile_width:        8,
        tile_height:       8,
        padding:           0,
        spacing:           0,
        scale:       @@scale,
        z:                 0
    )

    @@tileset.define_tile('black', 0, 0)
    @@tileset.define_tile('white', 1, 0)
    @@tileset.define_tile('blue' , 2, 0)
    @@tileset.define_tile('green', 3, 0)

    def self.draw_board
        (0..7).each do |y|
            (0..7).each do |x|
                if y % 2 == 0
                    if x % 2 == 0
                        @@tileset.set_tile('white', [
                            { x: x * (8 * @@scale), y: y * (8 * @@scale) },
                        ])
                    else
                        @@tileset.set_tile('green', [
                            { x: x * (8 * @@scale), y: y * (8 * @@scale) },
                        ])
                    end
                else
                    if x % 2 == 0
                        @@tileset.set_tile('green', [
                            { x: x * (8 * @@scale), y: y * (8 * @@scale) },
                        ])
                    else
                        @@tileset.set_tile('white', [
                            { x: x * (8 * @@scale), y: y * (8 * @@scale) },
                        ])
                    end
                end
            end
        end
    end

    def self.setup
        self.draw_board

        ('a'..'h').each do |x|
            Pawn.new('black', (x + '7'))
            Pawn.new('white', (x + '2'))

            case x
            when 'a', 'h'
                Rook.new('black', (x + '8'))
                Rook.new('white', (x + '1'))
            when 'b', 'g'
                Knight.new('black', (x + '8'))
                Knight.new('white', (x + '1'))
            when 'c', 'f'
                Bishop.new('black', (x + '8'))
                Bishop.new('white', (x + '1'))
            when 'd'
                Queen.new('black', (x + '8'))
                Queen.new('white', (x + '1'))
            when 'e'
                King.new('black', (x + '8'))
                King.new('white', (x + '1'))
            end
        end
    end
    
    def self.update_board_position(piece)
        @@tile[piece.board_position] = piece
    end

    def self._to_screen_position(board_position)
        x_val = board_position.getbyte(0) - ASCII_A
        y_val = (board_position.getbyte(1) - ASCII_8).abs
        
        { x: (x_val * 8 * @@scale), y: (y_val * 8 * @@scale) }
    end

    def self.scale
        @@scale
    end

    def self.scale_increase
        @@scale += 1
    end

    def self.scale_decrease
        @@scale -= 1
    end

    def self.update
        Board.draw_board
    end
    
    def self.display
        (ASCII_8..(ASCII_8-7)).step(-1).each do |y|
            ('a'..'h').each do |x|
                location = [x, y].pack('ac')
                piece = @@tile[location]

                if piece == nil
                    print "x"
                else
                    print piece.id
                end

                print ","
            end

            puts "\n"
        end
    end
end