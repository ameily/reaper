require 'pandoc-ruby'

class SoulsController < ApplicationController
    def new
        @soul = Soul.new
    end

    def create
        @soul = Soul.new(create_params)
        @soul.harvest_count = 0
        @soul.reap_count = 0
        @soul.rot_count = 0
        if @soul.save
            @soul.journals.create(
                :body => "Soul Sacrificed",
                :cat => 'status'
            )
            redirect_to @soul
        else
            render 'new'
        end
    end

    def show
        @soul = Soul.find(params[:id])
    end

    def index
        @souls = Soul.all
    end

    def convert_body
        dest = params[:format]
        @soul = Soul.find(params[:id])

        ct = 'text/plain'
        df = nil
        ext = nil
        if dest == 'docx'
            df = :docx
            ct = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
            ext = 'docx'
        elsif dest == 'pdf'
            df = :pdf
            ct = 'application/pdf'
            ext = 'pdf'
        else
            ct = 'text/plain'
            ext = 'md'
        end
        
        filename = "#{self.slugify(@soul.name)}.#{ext}"

        if df == nil
            send_data @soul.description,
                      filename: filename,
                      type: ct
        else
            cv = PandocRuby.new(@soul.description, :standalone, :from => :markdown, :to => df)
            send_data cv.convert,
                      filename: filename,
                      type: ct
        end
    end

    private def create_params
        params.require(:soul).permit(:name, :description)
    end

    def slugify(str)
        #strip the string
        ret = str.strip

        #blow away apostrophes
        ret.gsub! /['`]/,""

        # @ --> at, and & --> and
        ret.gsub! /\s*@\s*/, " at "
        ret.gsub! /\s*&\s*/, " and "

        #replace all non alphanumeric, underscore or periods with underscore
         ret.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '-'

         #convert double underscores to single
         ret.gsub! /-+/,"-"

         #strip off leading/trailing underscore
         ret.gsub! /\A[\-\.]+|[\-\.]+\z/,""

         ret
      end
end
