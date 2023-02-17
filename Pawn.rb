require 'Piece'

class Pawn < Piece
    def initialize(color, location, coord)
        super('P', color, location)
        @@spritesheet.set_tile('black_pawn', [
            { x: 8 * coord[0] * 2, y: 8 * coord[1] * 2 },
        ])
    end

    def move
    end

    def upgrade
    end
end