class Piece
    attr_reader :name
    attr_reader :color
    attr_reader :location
    
    def initialize(name, color, location)
        @name = name
        @color = color

        @@spritesheet = Tileset.new(
            'pieces.png',
            tile_width:  8,
            tile_height: 8,
            padding:     1,
            spacing:     1,
            scale:       2
        )

        @@spritesheet.define_tile('black_pawn',   0, 0)
        @@spritesheet.define_tile('black_rook',   1, 0)
        @@spritesheet.define_tile('black_knight', 2, 0)
        @@spritesheet.define_tile('black_bishop', 3, 0)
        @@spritesheet.define_tile('black_queen',  4, 0)
        @@spritesheet.define_tile('black_king',   5, 0)
        @@spritesheet.define_tile('white_pawn',   0, 1)
        @@spritesheet.define_tile('white_rook',   1, 1)
        @@spritesheet.define_tile('white_knight', 2, 1)
        @@spritesheet.define_tile('white_bishop', 3, 1)
        @@spritesheet.define_tile('white_queen',  4, 1)
        @@spritesheet.define_tile('white_king',   5, 1)

        @location = location

        case @name
        when 'R'
            @@spritesheet.set_tile('black_rook', [
                { x: 8 * (0 * 2), y: 8 * (1 * 2) }
            ])
        when 'K'
            @@spritesheet.set_tile('white_knight', [
                { x: 8 * (1 * 2), y: 8 * (1 * 2) }
            ])
        end
    end

    def move
    end
end