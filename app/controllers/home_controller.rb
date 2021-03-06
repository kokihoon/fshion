class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:new]

  def my_page
    @travel = Travel.where(user: current_user);
    @count = @travel.count
    @hashdata = Array.new
    @position = Array.new
    @one = Array.new
    for i in 0..@count-1
      data = Array.new
      data[0] = @travel[i].day1
      data[1] = @travel[i].day2
      data[2] = @travel[i].day3
      data[3] = @travel[i].day4
      data[4] = @travel[i].day5
      data[5] = @travel[i].day6
      data[6] = @travel[i].day7
      data[7] = @travel[i].day8
      @position[i] = @travel[i].position
      @one[i] = @travel[i].one
      @hashdata[i] = data
    end
    
    puts @hashdata
  end

  def index
    @travel = Travel.new
    test = params[:values]
    @travel.day1 = test[0]
    @travel.day2 = test[1]
    @travel.day3 = test[2]
    @travel.day4 = test[3]
    @travel.day5 = test[4]
    @travel.day6 = test[5]
    @travel.day7 = test[6]
    @travel.day8 = test[7]
    @travel.user = current_user
    @travel.position = params[:position]
    @travel.one = params[:one]
    @travel.save
    redirect_to '/home/my_page'
  end

  #Crate
  def new
  end

  def hotel
    # views/home/create.html.erb 를 보여줘라!
    puts '========================================================='
    @days = params[:days]
    @one = params[:one]
    @position = params[:position]
    @start = params[:start]
    @end = params[:end]
    puts '========================================================='
  end

  def attract
    @days = params[:days]
    @one = params[:one]
    @position = params[:position]
    @start = params[:start]
    @end = params[:end]

    @position1 = Attraction.where("category = 'ㄱ' AND position = ?", @position);
    @position2 = Attraction.where("category = 'ㄴ' AND position = ?", @position);
    @position3 = Attraction.where("category = 'ㄷ' AND position = ?", @position);
    @position4 = Attraction.where("category = 'ㄹ' AND position = ?", @position);
    @position5 = Attraction.where("category = 'ㅁ' AND position = ?", @position);
    @position6 = Attraction.where("category = 'ㅂ' AND position = ?", @position);
    @position7 = Attraction.where("category = 'ㅅ' AND position = ?", @position);
    @position8 = Attraction.where("category = 'ㅇ' AND position = ?", @position);
    @position9 = Attraction.where("category = 'ㅈ' AND position = ?", @position);
    @position10 = Attraction.where("category = 'ㅊ' AND position = ?", @position);
    @position11 = Attraction.where("category = 'ㅋ' AND position = ?", @position);
    @position12 = Attraction.where("category = 'ㅌ' AND position = ?", @position);
    @position13 = Attraction.where("category = 'ㅍ' AND position = ?", @position);
    @position14 = Attraction.where("category = 'ㅎ' AND position = ?", @position);
  end

  def detailed_content
    @pos = params[:pos]
    test = Attraction.where("value = ?", params[:pos])
    test.each do |q|
      @q = q
    end
  end

  def check
    @days = params[:days]
    @one = params[:one]
    @position = params[:position]
    @start = params[:start]
    @end = params[:end]
    @color = ['#FF0000', '#FF8000', '#FFFF00','#00FF00', '#0000FF', '#FE2EF7', '#B40486']
    plan = params[:test]
    hotel_start = params[:start]
    hotel_end = params[:end]
    one_toi = @one.to_i # 전체 일정 수
    allcount = plan.size    # 총 명소 개수
    one_count = allcount/one_toi   # 하루 명소 개수
    two_count = allcount%one_toi   # 나머지 명소 개수
    @tra = Array.new
    for i in 1..one_toi
      index_tra = Array.new
      index_tra.push(hotel_start.shift())
      if one_count != 0
        for j in 1..one_count
          if plan.size != 0
            index_tra.push(plan.pop())
          end
        end
      elsif one_count == 0 && allcount > 2
        for j in 1..2
          if plan.size != 0
            index_tra.push(plan.pop())
          end
        end
      else
        for j in 0..one_count
          if plan.size != 0
            index_tra.push(plan.pop())
          end
        end
      end
      index_tra.push(hotel_end.shift())
      @tra.push(index_tra)
    end
  end

  def map
    
  end
end