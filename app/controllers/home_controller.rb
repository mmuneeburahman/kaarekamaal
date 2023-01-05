class HomeController < ApplicationController
    def index
        @cases = Case.all
    end

    def event
        # redirect_to events_path
        render "home/event"
    end
end
