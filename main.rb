$LOAD_PATH << '.'

require 'Chess'

set width: 300, height: 300, title: 'Chess'
set background: 'black'

Board.setup
tick = 0

on :key_down do |event|
    case event.key
    when 'w'
        Piece.test
    when 's'
        Board.display
    when '='
        Board.scale_increase
        Board.update
    when '-'
        Board.scale_decrease
        Board.update
    else
        puts event.key
    end
end

update do
    if tick % 60 == 0
    end
    tick += 1
end

show