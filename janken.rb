class Janken
	def initialize()
		puts "じゃんけん・・・"
		puts "グーなら０、チョキなら１、パーなら２"
		@input = gets.chomp.to_i
		while @input > 2
			puts "入力が間違っています"
			puts "正しく入力してください"
			@input = gets.chomp.to_i
		end
	end

	def judgement
		hand_type = ["グー","チョキ","パー"]
		my_hand = @input
		pc_hand = rand(0..2)
		puts "あなたは#{hand_type[my_hand]}です"
		puts "相手は#{hand_type[pc_hand]}です"

		if my_hand == pc_hand
			puts "あいこです"
			$result = "draw"
			return true
		elsif (my_hand == 0 && pc_hand == 1) ||
					(my_hand == 1 && pc_hand == 2) ||
					(my_hand == 2 && pc_hand == 0)
					puts "あなたの勝ちです"
					$result = "win"
					return false
		elsif (my_hand == 0 && pc_hand == 2) ||
					(my_hand == 1 && pc_hand == 0) ||
					(my_hand == 2 && pc_hand == 1)
					puts "あなたの負けです"
					$result = "lose"
					return false
		end    
	end
end

class Accimuite_hoi
	def initialize()
		puts "あっちむいて・・・"
		puts "上なら０、右なら１、下なら２、左なら３"
		@input = gets.chomp.to_i
		while @input >3
			puts "入力が間違っています"
			puts "正しく入力してください"
			@input = gets.chomp.to_i
		end
	end
	def judgement_hoi
		direction = ["上","右","下","左"]
		my_direction = @input
		pc_direction = rand(0..3)
		puts "あなたは#{direction[my_direction]}を出しました"
		puts "相手は#{direction[pc_direction]}を出しました"

		if($result == "win" &&  my_direction == pc_direction)
			puts "あなたの勝ちです"
			$result = "win1"
			return false
		elsif($result == "lose" && my_direction == pc_direction)
			puts "あなたの負けです"
			$result = "lose1"
			return false
		else
			puts "ひきわけ"
			$result = "draw1"
			return true
		end
	end
end

janken = Janken.new()
janken.judgement
loop do
	while $result == "draw"
		janken = Janken.new()
		janken.judgement
	end
	while $result == "win" || $result == "lose"
		accimuite_hoi = Accimuite_hoi.new()
		accimuite_hoi.judgement_hoi
	end
	while $result == "draw1"
		janken = Janken.new()
		janken.judgement
	end
	if $result == "win1" || $result == "lose1"
		break
	end
end

while $result == "win1" || $result == "lose1"
	puts "ゲームを終わります"
	exit
end

