class EmployeePolicy
    attr_reader :current_account, :model
  
    def initialize(current_account, model)
      @current_account = current_account
      @employee = model
    end
  
    def edit?
      @current_account == @employee.account
    end
  
    def update?
      @current_account == @employee.account
    end

    def show_carts_for_employee?
      @current_account == @employee.account
    end

    def show_tafs_for_employee?
      @current_account == @employee.account
    end

    def show_items_for_employee?
      @current_account == @employee.account
    end

    def show_taf_items_for_employee?
      @current_account == @employee.account
    end
  
  end