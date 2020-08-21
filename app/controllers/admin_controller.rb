require "csv"
class AdminController < ApplicationController
    def user
        @user = User.where(admin:nil)
    end
    def form
        @form = Formal.all
    end
    def export

        
    end
    def create
        time = params.require(:form).permit(:from,:to)
        i = 0
        @form =Formal.where("date >= ?",time[:from] ).where("date <= ?",time[:to] )
        file = "report.csv"
       CSV.open(file,"wb")  do |csv|
            csv << ["ID","Name","Date","Company","Content","Note"]
            @form.map do |form|
                i+=1
                csv << [i,form.name,form.date,form.company,form.content,form.note]
            end
        end
        send_file file, :type => 'csv', :disposition => 'attachment'
    end
end
