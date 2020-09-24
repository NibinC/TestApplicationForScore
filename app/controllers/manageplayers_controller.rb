class ManageplayersController < ApplicationController
  def index
  	@player =	Player.paginate(:page => params[:page], :per_page => 4)

  end

  def show
  end

  def filter 

  end
  def sort_by_tot_rushing_yards
  	@player = Player.order("Yds desc").paginate(:page => params[:page], :per_page => 4)
  	download_csv(Player.order("Yds desc"))
  	logger.info("*** CSV file is downloaded for sort_by_tot_rushing_yards ****")
  end

  def sort_by_tot_longest_rush
	@player = Player.order("cast(Lng as signed) desc").paginate(:page => params[:page], :per_page => 4)
 	download_csv(Player.order("cast(Lng as signed) desc"))
   	logger.info("*** CSV file don for sort_by_tot_longest_rush ****")
   end

   def sort_by_tot_rushing_touch_downs
  	@player = Player.order("TD desc").paginate(:page => params[:page], :per_page => 4)
  	download_csv(Player.order("TD desc"))
   	logger.info("CSV file don for sort_by_tot_rushing_touch_downs")
   end

   def sort_by_all_three
   	@player = Player.order("cast(Lng as signed) desc,Yds desc,TD desc").paginate(:page => params[:page], :per_page => 4)
 	download_csv(Player.order("cast(Lng as signed) desc,Yds desc,TD desc"))
 	logger.info("CSV file don for sort_by_all_three")
   end

  def search
 		@player = Player.find_player_by_name(params[:search].to_s.humanize).paginate(:page => params[:page], :per_page => 4)
		if !@player.present?
			flash[:notice] ="No Matching Player"
			redirect_to(manageplayers_path)
		end 
  end

  def download
  	download_csv(Player.find_player_by_name(params[:search].to_s.humanize))
  	logger.info("CSV file downloaded for search results")
  end


  
  private

  	def download_csv(name)
  	  respond_to do |format|
      format.html
      format.csv { 
      send_data name.to_csv,
      filename: "export_#{Time.now}.csv",
      type: 'text/csv; charset=utf-8' 
      }
	  end
  	end

end
