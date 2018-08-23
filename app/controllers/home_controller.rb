class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:new]

  def my_page
    @travel = Travel.where(user: current_user);
    @count = @travel.count
    @hashdata = Array.new
    
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
    
      @hashdata[i] = data
    end

    puts @hashdata
  end

  def index
    @travel = Travel.new
    test = params[:values]
    @one = params[:one]
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
    redirect_to '/home/new'
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

    @position1 = Attraction.where("category like ?", "%ㄱ%" );
    @position2 = Attraction.where("category like ?", "%ㄴ%" );
    @position3 = Attraction.where("category like ?", "%ㄷ%");
    @position4 = Attraction.where("category like ?", "%ㄹ%");
    @position5 = Attraction.where("category like ?", "%ㅁ%");
    @position6 = Attraction.where("category like ?", "%ㅂ%");
    @position7 = Attraction.where("category like ?", "%ㅅ%");
    @position8 = Attraction.where("category like ?", "%ㅇ%");
    @position9 = Attraction.where("category like ?", "%ㅈ%");
    @position10 = Attraction.where("category like ?", "%ㅊ%");
    @position11 = Attraction.where("category like ?", "%ㅋ%");
    @position12 = Attraction.where("category like ?", "%ㅌ%");
    @position13 = Attraction.where("category like ?", "%ㅍ%");
    @position14 = Attraction.where("category like ?", "%ㅎ%");
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