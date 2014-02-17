class FoliosController < ApplicationController
def index
  @folios = Folio.all
  @customers = Customer.all
end

def show
  @folio = Folio.find(params[:id])
end
end
