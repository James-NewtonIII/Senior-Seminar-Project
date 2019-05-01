module HaveAllBaApproved
  private
    def have_all_ba_approved
      @taf.taf_items.each do |taf_item|
        if taf_item.ba_approval
          @taf.update(all_approved: true)
        else
          @taf.update(all_approved: false)
          break
        end
      end
    end
end