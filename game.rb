class Game
  def initialize(player1_name, player2_name)
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
    @current_player = @player1
  end

  def switch_players
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def game_loop
    loop do
      question = Questions.new
      puts "#{@current_player.name}: #{question.question_text}"
      user_answer = gets.chomp.to_i

      if user_answer == question.correct_answer
        puts "#{@current_player.name}: Well done!"
      else
        @current_player.lose_life
        puts "#{@current_player.name}: That's incorrect!"
      end

      puts "P1: #{player_score(@player1)} vs P2: #{player_score(@player2)}"
      switch_players

      break if game_over?
    end
    declare_winner
  end

  private

  def player_score(player)
    "#{player.lives}/3"
  end

  def game_over?
    @player1.lives.zero? || @player2.lives.zero?
  end

  def declare_winner
    winner = (@player1.lives > @player2.lives) ? @player1 : @player2
    loser = (winner == @player1) ? @player2 : @player1

    puts "#{winner.name} wins with a score of #{player_score(winner)}"
    puts "GAME OVER\nGoodbye, thanks for playing!"
  end
end
