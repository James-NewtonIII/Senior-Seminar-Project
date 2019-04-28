class PaymentManagerPolicy
    attr_reader :current_account, :model
  
    def initialize(current_account, model)
      @current_account = current_account
      @payment_manager = model
    end
  
    def edit?
      @current_account == @payment_manager.account
    end
  
    def update?
      @current_account == @payment_manager.account
    end

    def show_carts_for_payment_manager?
      @current_account == @payment_manager.account
    end

    def show_taf_for_payment_manager?
      @current_account == @payment_manager.account
    end

    def show_items_for_payment_manager?
      @current_account == @payment_manager.account
    end

    def show_taf_items_for_payment_manager?
      @current_account == @payment_manager.account
    end
  
  end