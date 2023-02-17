class Board
    attr_reader :tiles
    
    def initialize
        @tiles = []
        @background = []
        @scale = 2
        @tileset = Tileset.new(
            'background-tiles.png',
            tile_width:  8,
            tile_height: 8,
            padding:     0,
            spacing:     0,
            scale:       @scale
        )

        @tileset.define_tile('black', 0, 0)
        @tileset.define_tile('white', 1, 0)
        @tileset.define_tile('blue' , 2, 0)
        @tileset.define_tile('green', 3, 0)
        
        draw_board
        setup
    end

    def draw_board
        (0..7).each do |y|
            (0..7).each do |x|
                if y % 2 == 0
                    if x % 2 == 0
                        @tileset.set_tile('green', [
                            { x: x * (8 * @scale), y: y * (8 * @scale) },
                        ])
                    else
                        @tileset.set_tile('white', [
                            { x: x * (8 * @scale), y: y * (8 * @scale) },
                        ])
                    end
                else
                    if x % 2 == 0
                        @tileset.set_tile('white', [
                            { x: x * (8 * @scale), y: y * (8 * @scale) },
                        ])
                    else
                        @tileset.set_tile('green', [
                            { x: x * (8 * @scale), y: y * (8 * @scale) },
                        ])
                    end
                end
            end
        end
    end

    def setup
        @tiles << Pawn.new('b', 'a8', [0, 0])
        @tiles << Pawn.new('b', 'b8', [1, 0])
        @tiles << Piece.new('R', 'b', 'a7')
        @tiles << Piece.new('K', 'w', 'b7')
    end

=begin
    def setup
        (0..63).each do |x|
            if x == 0
                @tiles << Piece.new('R', 'w', 'a1')
                @tiles << Piece.new('N', 'w', 'b1')
                @tiles << Piece.new('B', 'w', 'c1')
                @tiles << Piece.new('Q', 'w', 'd1')
                @tiles << Piece.new('K', 'w', 'e1')
                @tiles << Piece.new('B', 'w', 'f1')
                @tiles << Piece.new('N', 'w', 'g1')
                @tiles << Piece.new('R', 'w', 'h1')
            elsif x >= 8 && x < 16
                @tiles << Pawn.new('w', [97 + (x % 8), 50].pack("CC"))
            elsif x >= 16 && x < 48
                @tiles << ''
            elsif x >= 48 && x < 56
                @tiles << Pawn.new('b', [97 + (x % 8), 55].pack("CC"))
            elsif x == 56
                @tiles << Piece.new('R', 'b', 'a8')
                @tiles << Piece.new('N', 'b', 'b8')
                @tiles << Piece.new('B', 'b', 'c8')
                @tiles << Piece.new('Q', 'b', 'd8')
                @tiles << Piece.new('K', 'b', 'e8')
                @tiles << Piece.new('B', 'b', 'f8')
                @tiles << Piece.new('N', 'b', 'g8')
                @tiles << Piece.new('R', 'b', 'h8')
            end
        end
    end
=end

    def display
        (63..1).step(-1).each do |x|
            if (x % 8) == 0
                puts
            end

            if @tiles[x - 1].class == String
                print @tiles[x - 1]
            else
                print @tiles[x - 1].name + @tiles[x - 1].location
            end

            print ','
        end
    end
end