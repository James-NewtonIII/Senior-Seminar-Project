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
  
  end