class Piece
    attr_reader :name, 
                :color,
                :id,
                :board_position, 
                :screen_position,
                :spritesheet
    
    # Credit to Brian Provan (Arsonide) @ OpenGameArt for spritesheet
    # https://opengameart.org/content/colorful-chess-pieces
    @@spritesheet = Tileset.new(
        'resources/pieces.png',
        tile_width:                      128,
        tile_height:                     128,
        scale:       (Board.scale / 16.to_f),
        z:                                 1
    )

    @@spritesheet.define_tile('black_pawn',   0, 0)
    @@spritesheet.define_tile('black_knight', 1, 0)
    @@spritesheet.define_tile('black_bishop', 2, 0)
    @@spritesheet.define_tile('black_rook',   3, 0)
    @@spritesheet.define_tile('black_queen',  4, 0)
    @@spritesheet.define_tile('black_king',   5, 0)
    @@spritesheet.define_tile('white_pawn',   0, 1)
    @@spritesheet.define_tile('white_knight', 1, 1)
    @@spritesheet.define_tile('white_bishop', 2, 1)
    @@spritesheet.define_tile('white_rook',   3, 1)
    @@spritesheet.define_tile('white_queen',  4, 1)
    @@spritesheet.define_tile('white_king',   5, 1)

    def initialize(name, color, board_position)
        @name = name
        @color = color
        # handles the unique case of the night for id
        if name == 'knight'
            @id = color[0] + 'n'
        else
            @id = color[0] + name[0].upcase
        end
        
        # insert the piece into the board array
        @board_position = board_position
        Board.update_board_position(self)
        
        # Have the board handle translating board positions to screen positions
        # @screen_position = Board.get_screen_position(@board_position)
        @screen_position = Board._to_screen_position(@board_position)

        draw
    end

    def move
    end

    def draw
        @@spritesheet.set_tile("#{@color}_#{@name}", [
            @screen_position
        ])
    end

    def self.test
        @@spritesheet.clear_tiles
        puts "cleared board"
    end

    def self.output
        puts @@spritesheet.get_tile(0, 0)
    end
end