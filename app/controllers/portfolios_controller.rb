class PortfoliosController < ApplicationController
  layout "portfolio"

  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    if @portfolio_item.save
      redirect_to portfolios_path, notice: "Your portfolio item is live"
    else
      render :new
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    if @portfolio_item.update(portfolio_params)
      redirect_to portfolios_path, notice: "Your portfolio is updated"
    else
      render :edit
    end
  end

  def destroy
    @portfolio_item = Portfolio.find(params[:id])
    @portfolio_item.destroy
    redirect_to portfolios_path, notice: "Portfolio is removed"
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name])
  end
end
