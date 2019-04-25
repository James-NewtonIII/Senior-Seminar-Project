module CurrentTaf
    private
        def set_current_taf
            @taf = Taf.find(session[:taf_id])
        rescue ActiveRecord::RecordNotFound
            @taf = Taf.create
            session[:taf_id] = @taf.id
        end
    end